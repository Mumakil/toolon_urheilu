logfmt = require 'logfmt'
serveStatic = require 'serve-static'
pug = require 'pug'

module.exports = (app) ->
  app.use logfmt.requestLogger()
  app.use '/public', serveStatic('public', index: false)

  app.engine 'pug', pug.__express
