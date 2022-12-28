const Event = require('../db/models/event')
const { getDb } = require('../db/connection')

const registerEvent = async (req, res) => {
    try {
        console.log(req)
        const { title, description, poster, startDate, finalDate } = req.body
        const newEvent = new Event({ title, description, date: [startDate, finalDate], poster: poster['0'] });
        await newEvent.save()
        res.status(200).send({ success: true })
    } catch (error) {
        console.error(error)
        const msg =
            error.message ||
            (error.stack && error.stack.split('\n')[0]) ||
            'Unknown error'
        res.status(403).send({ error: msg })
    }
}

const getEvents = async (req, res) => {
    try {
        const data = await Event.find({})
        res.status(200).send(data)
    } catch (error) {
        console.error(error)
        const msg =
            error.message ||
            (error.stack && error.stack.split('\n')[0]) ||
            'Unknown error'
        res.status(403).send({ error: msg })
    }
}

module.exports = {
    getEvents,
    registerEvent
}