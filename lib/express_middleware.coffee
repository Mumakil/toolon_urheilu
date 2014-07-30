logfmt = require 'logfmt'
serveStatic = require 'serve-static'

module.exports = (app) ->
  app.use logfmt.requestLogger()
  app.use '/public', serveStatic('public', index: false)
