'use strict';

module.exports = {
   /**
     * Promise to fetch record
     *
     * @return {Promise}
     */

  async destroy(ctx) {
    const user = await strapi.query("user", "users-permissions").findOne({id: ctx.params.id });

    if(user.events.length > 0) {
      user.events.forEach(async event => {
        console.log(event.id)
        await strapi.query("events").delete({id: event.id});
      });
    }

    await strapi.query("user", "users-permissions").delete({id: ctx.params.id});

    return user;
  }
}
