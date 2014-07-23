logfmt = require 'logfmt'

module.exports = (app) ->
  app.use logfmt.requestLogger()