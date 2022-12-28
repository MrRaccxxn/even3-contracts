const express = require('express')
const event = require('../controllers/event.controller');
const eventRouter = express.Router()
const upload = require('../middlewares/multer')

eventRouter.get('/', event.getEvents)
eventRouter.post('/', upload.single('file'), event.registerEvent)

module.exports = eventRouter
