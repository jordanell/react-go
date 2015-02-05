http          = require('http')
finalhandler  = require('finalhandler')
serveStatic   = require('serve-static')
path          = require('path')
util          = require('util')

serve = serveStatic(path.resolve(__dirname + '../../../public/'))
port  = 1967

server = http.createServer((req, res) ->
  done = finalhandler(req, res)
  serve(req, res, done)
)

server.listen(port)

util.puts('Listening on ' + port + '...')
util.puts('Press Ctrl + C to stop.')
