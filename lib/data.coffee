fs = require 'fs'

module.exports = {}

fs.readdir 'data', (err, files) ->
  throw new Error 'Could not load game data:' + error.toString() if err?
  for file in files when file.indexOf('.json') >= 0
    