logfmt = require 'logfmt'
serveStatic = require 'serve-static'

module.exports = (app) ->
  app.use logfmt.requestLogger()
  app.use serveStatic 'public', 
    index: false
