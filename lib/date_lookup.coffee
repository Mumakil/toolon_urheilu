request = require 'request'

apiUrl = 'https://toolo-api.herokuapp.com'

module.exports = (dateToCheck, cb) ->
  request
    uri: "#{apiUrl}/${dateToCheck || ''}", json: true,
    (err, res, body) ->
      cb(err, body?.can_have_beers)
