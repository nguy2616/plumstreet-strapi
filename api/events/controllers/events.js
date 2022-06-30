'use strict';
const { sanitizeEntity } = require('strapi-utils');
const constants = require('./../../../config/constants');
const { getLoginUser, sanitizeUser } = require('../../common/common');
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

      const event = await strapi
      .query("events")
      .findOne({ id: ctx.params.id });

      event.sent_proposals.forEach(async proposal => {
        await strapi.query("proposals").delete({id: proposal.id})
      });
      await strapi
      .query("events")
      .delete({ id: ctx.params.id });
      return sanitizeEntity(event, { model: strapi.models.events });
  }
};
