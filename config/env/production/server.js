module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: env('STRAPI_HOST', ''),
  admin: {
    // url: '/', // remove comment out when build admin UI panel
  },
});
