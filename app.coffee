express = require 'express'
logfmt = require 'logfmt'

app = express()

app.use logfmt.requestLogger()

app.get '/', (req, res) ->
	res.send 'hello'

port = Number(process.env.PORT || 5000)

app.listen port, ->
	console.log('Started server in port', port)