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
    let cuisine_types = await strapi
    .query("cuisine-types")
    .find(ctx.query);

    cuisine_types.map(cuisine_type => sanitizeEntity(cuisine_type, { model: strapi.models.cuisine_type }));

    cuisine_types.forEach( cuisine_type => {
      const isCheck = false
      cuisine_type.isCheck = isCheck
      final_data.push(cuisine_type);
    });
    return final_data;
}

};
