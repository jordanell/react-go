module.exports = class

  @boot: ->
    app = new Davis.App

    app.configure (config) ->
      config.handleRouteNotFound = true

    app.use(route) for route in routes

    Davis.history.replace Davis.Request.forPageLoad()

    # Start the client
    app.start()

    # Firefox doesn't fire the onpopstate so lets just pop it anyways
    if window.navigator.userAgent.match(/Moz/g)
      require('router').redirect(window.location.href)

routes = require 'routes'