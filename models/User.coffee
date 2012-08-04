mongoose = require 'mongoose'

UserSchema = new mongoose.Schema
  tag: String
  gid: String
  expires: Date

module.exports = mongoose.model 'User', UserSchema
