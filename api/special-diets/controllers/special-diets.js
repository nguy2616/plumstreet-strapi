'use strict';
const { sanitizeEntity } = require('strapi-utils');


const addSearchQuery = function(query, searchValue) {
  query['_where'] = {
      _or: [
        { 'name_contains': searchValue }
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
    let special_diets = await strapi
    .query("special-diets")
    .find(ctx.query);

    special_diets.map(special_diet => sanitizeEntity(special_diet, { model: strapi.models.special_diet }));

    special_diets.forEach( special_diet => {
      const isCheck = false
      special_diet.isCheck = isCheck
      final_data.push(special_diet);
    });
    return final_data;
}

};
