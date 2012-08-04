ApiServer = require 'apiserver'
config = require 'config'

apiserver = new ApiServer()
port = process.env.PORT || config.port
apiserver.listen port, onListen
console.log "API server listening on port #{port} in #{process.env.NODE_ENV} mode"

onListen = (err) ->
  if err
    console.error "Something terrible happened: #{err.message}"
  else
    console.log "Successfully bound to port #{@port}"
    setTimeout apiserver.close onClose, 5000

onClose = () -> console.log "port unbound correctly"

HelloModule =
  world: (req, resp) ->
    resp.serveJSON 'Hello, world!'

apiserver.addModule 'v1', 'hello', HelloModule


sendMessage = (destination, message) ->
  # TODO

getOriginator = (details) ->
  # TODO

getDestination = (details) ->
  # TODO

sendErrorResponse = (from, error) ->
  # TODO

getForwardedMessage = (details, from, to) ->
  # TODO

updateTimestamps = (arr) ->
  # TODO



onMessageRecieved = (details) ->
  from = getOriginator(details)
  to = getDestination(details)
  if to == null
    sendErrorResponse(from, 'no destination: use a hastag like #secondfriend')
    return
  sendMessage(to, getForwardedMessage(details, from, to))
  updateTimestamps([from, to])
