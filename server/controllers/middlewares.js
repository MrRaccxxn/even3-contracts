const jose = require('jose')

const validateUser = async (req, res, next) => {
    try {
        const idToken = req.headers.authorization?.split(' ')[1];
        const app_pub_key = req.body.appPubKey;

        const jwks = jose.createRemoteJWKSet(new URL("https://api.openlogin.com/jwks"));

        const jwtDecoded = await jose.jwtVerify(idToken, jwks, { algorithms: ["ES256"] });

        if ((jwtDecoded.payload).wallets[0].public_key === app_pub_key) {
            next()
        } else {
            res.status(400).json({ name: 'Verification Failed' })
        }
    } catch (error) {
        res.status(400).json({ name: 'Verification Failed' })
    }
}

module.exports = {
    validateUser
}