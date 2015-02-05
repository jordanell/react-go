# All routes for the go app

{ defaultHandler } = require 'routes/middleware'

module.exports = ->

  # This is the main route for the go app
  @get '/', defaultHandler, (req) ->
    React.render React.createFactory(require 'components/go')(), APP_ROOT