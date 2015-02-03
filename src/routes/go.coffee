# All routes for the go app

module.exports = ->

  # This is the main route for the go app
  @get '/', null, (req) ->
    React.render React.createFactory(require 'components/go')(), APP_ROOT