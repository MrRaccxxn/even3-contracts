const express = require('express')
const router = express.Router()

async function login(req, res) {
    var options = {
        method: 'POST',
        url: `https://${process.env.AUTH0_DOMAIN}/oauth/token`,
        headers: { 'content-type': 'application/x-www-form-urlencoded' },
        form: {
            grant_type: 'authorization_code',
            client_id: process.env.AUTH0_CLIENT_ID || '',
            client_secret: process.env.AUTH0_CLIENT_SECRET || '',
            code: req.query.code, // the authorisation code you got from auth0
            redirect_uri: 'https://{YOUR_FRONTEND_URL}',
            scope: "openid profile email"
        }
    };
}

router.get('/callback', (req, res) => {
    var options = {
        method: 'POST',
        url: 'https://{YOUR_DOMAIN_URL}/oauth/token',
        headers: { 'content-type': 'application/x-www-form-urlencoded' },
        form: {
            grant_type: 'authorization_code',
            client_id: 'AUTH0_CLIENT_ID',
            client_secret: 'AUTH0_CLIENT_SECRET',
            code: req.query.code, // the authorisation code you got from auth0
            redirect_uri: 'https://{YOUR_FRONTEND_URL}',
            scope: "openid profile email"
        }
    };

    var id_token = "";

    request(options, function (error, response, data) {
        id_token = JSON.parse(data)["id_token"];
        redirect_url = "http://{YOUR_FRONTEND_URL}?token=%22+id_token";
        // Redirection URL to frontend with `id_token` as a query parameter
        res.redirect(redirect_url);
    });
})

module.exports = router
