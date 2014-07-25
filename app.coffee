config = require './lib/express_config'
middleware = require './lib/express_middleware'
dateLookup = require './lib/date_lookup'
express = require 'express'
moment = require 'moment'

app = express()

config(app)
middleware(app)

app.get '/', (req, res) ->
  today = dateLookup(moment().format("YYYY-MM-DD"))
  tomorrow = dateLookup(moment().add('days', 1).format('YYYY-MM-DD'))
  res.format(

    'text/plain': ->
      textResponse =  'Voiko tänään mennä baariin Töölössä?\n\n'
      if today
        textResponse += 'No ei voi ku on peli. '
        if !tomorrow
          textResponse += 'Mut huomen voi!'
        else
          textResponse += 'Eikä voi muuten huomennakaan.'
      else
        textResponse += 'Näköjään voi! '
        if tomorrow
          textResponse += 'Mut huomenna ei voi.'
        else
          textResponse += 'Niin voi huomennakin!'
      res.send 200, textResponse
    'application/json': ->
      res.send(200, text: 'Voiko Töölössä mennä baariin?', today: !today, tomorrow: !tomorrow)
  )

port = Number(process.env.PORT || 5000)

app.listen port, ->
	console.log('Started server in port', port)
