
module.exports = ({ env }) => ({
   email: {
     provider: env('MAIL_PROVIDER', 'sendinblue'),
     providerOptions: {
       sendinblue_api_key: env('SIB_API_KEY', ''),
       sendinblue_default_replyto: env('SIB_DEFAULT_REPLY_TO', ''),
       sendinblue_default_from: env('SIB_DEFAULT_FROM', ''),
       sendinblue_default_from_name: env('SIB_DEFAULT_FROM_NAME', ''),
     },
     settings: {
       defaultFrom: env('SIB_DEFAULT_FROM', ''),
       defaultReplyTo: env('SIB_DEFAULT_REPLY_TO', ''),
     },
   },
  upload: {
    provider: env('UPLOAD_PROVIDER', ''),
    providerOptions: {
      accessKeyId: env('AWS_ACCESS_KEY_ID', ''),
      secretAccessKey: env('AWS_SECRET_ACCESS_KEY', ''),
      params: {
        Bucket: env('UPLOAD_BUCKET', ''),
      },
    },
  },
});
