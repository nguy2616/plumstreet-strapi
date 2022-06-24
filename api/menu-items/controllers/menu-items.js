'use strict';
const { sanitizeEntity } = require('strapi-utils');
const constants = require('./../../../config/constants');
const { getLoginUser } = require('../../common/common');

const addSearchQuery = function(query, searchValue) {
  query['_where'] = {
      _or: [
        { 'name_contains': searchValue },
        { 'desc_contains': searchValue },
        { 'menu.name_contains': searchValue }
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

    if(searchValue){
      // add where query
      addSearchQuery(ctx.query, searchValue)
    }

    let final_data = [];
    let menu_items = await strapi
    .query("menu-items")
    .find(ctx.query);

    menu_items.map(menu_item => sanitizeEntity(menu_item, { model: strapi.models.menu_item }));

    menu_items.forEach( menu_item => {
      const order = menu_item.id
      menu_item.order = order
      final_data.push(menu_item);
    });
    return final_data;
},

/**
     * Promise to fetch record
     *
     * @return {Promise}
     */
  async findOne(ctx) {

    let final_item = null
    let fav_items_id = []

    const menu_item = await strapi
    .query("menu-items")
    .findOne({ id: ctx.params.id });

    //if(ctx.state.user && (ctx.state.user.role.id == constants.CLIENT_ROLE)) {
    //  const login_user = await getLoginUser(ctx);
    //  if (login_user.fav_menu_items.length > 0) {
    //    fav_items_id = login_user.fav_menu_items.map(function(obj) {
    //      return obj['id']
    //    });
    //  }
    //}
    //const isFav = fav_items_id.includes(menu_item.id);
    menu_item.isFav = false;
    final_item = menu_item;
    return final_item;
 }

};
