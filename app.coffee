config = require './lib/express_config'
middleware = require './lib/express_middleware'
dateLookup = require './lib/date_lookup'
express = require 'express'
moment = require 'moment'

app = express()

config(app)
middleware(app)

app.get /^\/(\.(\w+))?$/, (req, res) ->
  dateLookup moment().format("YYYY-MM-DD"), (err, today) ->
    dateLookup moment().add(1, 'days').format('YYYY-MM-DD'), (err, tomorrow) ->
      response =
        text: ->
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
          res.type('text/plain')
          res.status(200).send textResponse
        json: ->
          res.type('application/json')
          res.status(200).send q: 'Voiko tänään mennä baariin Töölössä?', a: {today: !today, tomorrow: !tomorrow}
        html: ->
          res.locals.today = today
          res.locals.tomorrow = tomorrow
          res.type('text/html')
          res.render 'index.pug'

      if req.params[1]? && req.params[1] != ''
        if response[req.params[1]]?
          response[req.params[1]]()
        else
          res.type 'text/plain'
          res.render 406, 'Not acceptabble'
      else
        res.format(response)

app.get '/time', (req, res) ->
  res.type('text/plain')
  text = "Today: #{moment().format("YYYY-MM-DD")}
  \nTime: #{moment().format()}
  \nTimezone: #{moment().format('ZZ')}"
  res.send 200, text

port = Number(process.env.PORT || 5000)

app.listen port, ->
	console.log('Started server in port', port)
