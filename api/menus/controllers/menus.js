'use strict';
const { sanitizeEntity } = require('strapi-utils');
const constants = require('./../../../config/constants');
const { getLoginUser, sanitizeUser } = require('../../common/common');
/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */
const addSearchQuery = function(query, searchValue) {
  query['_where'] = {
    _or: [
      { 'name_contains': searchValue },
      { 'description_contains': searchValue },
      { 'company.name_contains': searchValue },
    ]
  };
}
module.exports = {
   /**
     * Promise to fetch record
     *
     * @return {Promise}
     */
    async find(ctx) {
      const searchValue = ctx.query.searchValue;
      delete ctx.query.searchValue;
      ctx.query['_publicationState'] = 'live';

      //add search where query
      if(searchValue) {
        addSearchQuery(ctx.query, searchValue)
      }

      let final_data = [];
      let fav_menus_id = [];
      let user_cmts_id = []
      let menus = await strapi.query("menus").find(ctx.query)

      menus.map(menu => sanitizeEntity(menu, { model: strapi.models.menu }));

     // add favorites menu if user is client
      if(ctx.state.user && (ctx.state.user.role.id == constants.CLIENT_ROLE)) {
        const login_user = await getLoginUser(ctx);

        //if (login_user.fav_menus.length > 0) {
        //  fav_menus_id = login_user.fav_menus.map(function(obj) {
        //    return obj['id']
        //  });
        //}
        if (login_user.menu_comments.length > 0) {
          user_cmts_id = login_user.menu_comments.map(function(obj) {
            return obj['id']
          })
        }
      }

      // add isFav field to data
      menus.forEach(menu => {
        //const isFav = fav_menus_id.includes(menu.id);
        menu.isFav = false
        menu.comments.forEach(cmt => {
          if (user_cmts_id.includes(cmt.id)) {
            menu.note = cmt
          }
        })
        final_data.push(menu)
      });

      return final_data;
    },
    /**
     * Promise to fetch record
     *
     * @return {Promise}
     */
  async findOne(ctx) {

    let final_menu = null
    let fav_items_id = []
    let user_cmts_id = []

    const menu = await strapi
    .query("menus")
    .findOne({ id: ctx.params.id });

    if(ctx.state.user && (ctx.state.user.role.id == constants.CLIENT_ROLE)) {
      // add favorite items
      const login_user = await getLoginUser(ctx);
      //if (login_user.fav_menu_items.length > 0) {
      //  fav_items_id = login_user.fav_menu_items.map(function(obj) {
      //    return obj['id']
      //  });
      //}
      if (login_user.menu_comments.length > 0) {
        user_cmts_id = login_user.menu_comments.map(function(obj) {
          return obj['id']
        })
      }
    }
    await menu.menu_items.forEach(item => {
      //const isFav =  fav_items_id.includes(item.id);
      item.isFav = false;
    });
    //add user comment
    await menu.comments.forEach(cmt => {
      if (user_cmts_id.includes(cmt.id)) {
        menu.note = cmt
      }
    })


    final_menu = await menu

    return final_menu;
 },
   /**
     * Promise to fetch record
     *
     * @return {Promise}
     */
    async delete(ctx) {

      const menu = await strapi
      .query("menus")
      .findOne({ id: ctx.params.id });

      menu.menu_items.forEach(async item => {
        await strapi.query("menu-items").delete({id: item.id})
      });
      await strapi
      .query("menus")
      .delete({ id: ctx.params.id });
      return sanitizeEntity(menu, { model: strapi.models.menus });
  }
};
