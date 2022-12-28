const mongoose = require('mongoose');
require('dotenv').config()

var _db;
const uri =
    `mongodb+srv://${process.env.MONGO_DB_USER}:${process.env.MONGO_DB_PASS}@${process.env.MONGO_DB_HOSTNAME}/?retryWrites=true&w=majority`

module.exports = {
    connectToServer: async function (callback) {
        try {
            _db = await mongoose.connect(uri);
        }
        catch (error) {
            return callback(error)
        }
    },
    getDb: function () {
        return _db;
    }
};