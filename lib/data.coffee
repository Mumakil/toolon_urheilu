fs = require 'fs'

dataDir = 'data/'

module.exports = {}

fs.readdir dataDir, (err, files) ->
  throw new Error 'Could not load game data:' + error.toString() if err?
  for file in files when file.indexOf('.json') >= 0
    do (file) ->
      fs.readFile dataDir + file, (err, data) ->
        module.exports[file] = JSON.parse data.toString('utf8')

    