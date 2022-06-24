module.exports = ({ env }) => ({
    settings: {
        cors: {
            enabled: true,
            origin: [
                env('STRAPI_HOST', ''),
                env('STRAPI_ADMINUI_HOST', ''),
                "http://localhost:1337",
                "https://plumstreet-admin.amagumolabs.net",
                "https://plumstreet-bk.amagumolabs.net",
                "https://app-plumstreet.amagumolabs.net",
                "http://localhost:8080",
                "http://192.168.1.1:8080",
                "http://192.168.1.2:8080",
                "http://192.168.1.3:8080",
                "http://192.168.1.4:8080",
                "http://192.168.1.5:8080",
                "http://192.168.1.6:8080",
                "http://192.168.1.7:8080",
                "http://192.168.1.8:8080",
                "http://192.168.1.9:8080",
                "http://192.168.1.10:8080",
                "http://192.168.1.11:8080",
                "http://192.168.1.12:8080",
                "http://192.168.1.13:8080",
                "http://192.168.1.14:8080",
                "http://192.168.1.15:8080",
                "http://192.168.1.16:8080",
                "http://192.168.1.17:8080",
                "http://192.168.1.18:8080",
                "http://192.168.1.19:8080",
                "http://192.168.1.20:8080",
            
            ]
        },
    },
});
