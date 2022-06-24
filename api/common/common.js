const { sanitizeEntity } = require('strapi-utils');
const axios = require('axios')
var querystring = require('querystring');
const constants = require('../../config/constants');

const sanitizeUser = user =>
 sanitizeEntity(user, {
   model: strapi.query('user', 'users-permissions').model,
 });

const getLoginUser = (ctx) => {
  return strapi.query('user', 'users-permissions')
  .findOne({id: ctx.state.user.id});

}


module.exports = {
  sanitizeUser,
  getLoginUser
}
