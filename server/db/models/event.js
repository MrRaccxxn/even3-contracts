const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const EventSchema = new Schema({
  id: {
    type: mongoose.Schema.Types.ObjectId,
    index: true,
    required: true,
    auto: true,
  },
  title: {
    type: String,
    require: true,
  },
  owner: {
    type: String,
    require: true,
  },
  date: {
    type: [Date],
    require: true,
  },
  poster: {
    data: Buffer,
    contentType: String,
    require: false,
  },
  description: {
    type: String,
    require: false,
  },
  place: {
    type: String,
    require: false,
  },
});

module.exports = mongoose.model('Event', EventSchema)