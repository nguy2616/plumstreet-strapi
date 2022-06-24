'use strict';
const { sanitizeEntity } = require('strapi-utils');

/**
 * Read the documentation (https://strapi.io/documentation/developer-docs/latest/development/backend-customization.html#core-controllers)
 * to customize this controller
 */

module.exports = {
   /**
     * Promise to fetch record
     *
     * @return {Promise}
     */
    async delete(ctx) {

      const company = await strapi
      .query("companies")
      .findOne({ id: ctx.params.id });
      if (company.contacts.length > 0) {
        company.contacts.forEach(async user => {
          await strapi.query("user", "users-permissions").delete({id: user.id})
         });
      }

      if (company.foodtrucks.length > 0) {
        company.foodtrucks.forEach(async foodtruck => {
          await strapi.query("foodtrucks").delete({id: foodtruck.id})
        });
      }

      if (company.menus.length > 0) {
        company.menus.forEach(async menu => {
          menu = await strapi
          .query("menus")
          .findOne({ id: menu.id });

          menu.menu_items.forEach(async item => {
            await strapi.query("menu-items").delete({id: item.id})
          });

          await strapi.query("menus").delete({id: menu.id})
        });
      }

      await strapi
      .query("companies")
      .delete({ id: ctx.params.id });
      return sanitizeEntity(company, { model: strapi.models.companies });
  }
};
