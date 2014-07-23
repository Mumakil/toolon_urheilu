config = require './lib/express_config'
middleware = require './lib/express_middleware'
express = require 'express'

app = express()

config(app)
middleware(app)

app.get '/', (req, res) ->
	res.send 'hello'

port = Number(process.env.PORT || 5000)

app.listen port, ->
	console.log('Started server in port', port)