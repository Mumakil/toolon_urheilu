_ = require 'lodash'
fs = require 'fs'

data = fs.readFileSync(process.argv[2]).toString('utf8')
lines = data.split('\n')
games = (line.split(' ').slice(1, 5) for line in lines)
game.splice(1, 2) for game in games 

console.log JSON.stringify games
