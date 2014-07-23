_ = require 'lodash'
fs = require 'fs'

transmogrifyDate = (dateString) ->
  [day, month] = dateString.split('.')
  year = if Number(month) < 6 then 2015 else 2014
  "#{year}-#{month}-#{day}"

data = fs.readFileSync(process.argv[2]).toString('utf8')
lines = data.split('\n')
games = (line.split(' ').slice(1, 5) for line in lines)
game.splice(1, 2) for game in games 
games = (
  {
    date: transmogrifyDate(date), 
    game: game, 
    home: game.indexOf('IFK') == 0
  } for [date, game] in games)
console.log JSON.stringify games
