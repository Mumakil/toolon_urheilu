logfmt = require 'logfmt'
serveStatic = require 'serve-static'
jade = require 'jade'

module.exports = (app) ->
  app.use logfmt.requestLogger()
  app.use '/public', serveStatic('public', index: false)

  app.engine 'jade', jade.__express