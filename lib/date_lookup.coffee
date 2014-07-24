data = require './data'

module.exports = (dateToCheck) ->
  for own name, dataset of data
    return true for {date, home} in dataset when dateToCheck == date && home
  false
