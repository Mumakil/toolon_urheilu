fs = require 'fs'

transmogrifyDate = (dateString) ->
  [day, month, year] = dateString.split(' ')[0].split('.')
  "#{year}-#{month}-#{day}"

data = fs.readFileSync(process.argv[2]).toString('utf8')
lines = data.split('\n')

index = 0
games = [[]]
for line in lines
  if line.trim().length > 0
    games[index].push(line)
  else
    index += 1
    games[index] = []
games = (game.slice(1, 3) for game in games)
games = ({
  date: transmogrifyDate(date)
  game: game
  kind: 'football'
  home: game.indexOf('HJK') == 0
} for [date, game] in games)

console.log JSON.stringify(games, null, 2)