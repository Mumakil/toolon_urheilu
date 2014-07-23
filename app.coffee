express = require 'express'

app = express()

app.get '/', (req, res) ->
	res.send 'hello'

app.listen(process.env.PORT)
console.log('Started server in port', process.env.PORT)