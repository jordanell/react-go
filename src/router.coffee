# A module to control the history stack of the browser
module.exports =

  # Add this path to the history
  visit: (path, params = null) ->
    request = @buildRequest(path, params)
    Davis.location.assign(request)

  # Replace the history with this path
  redirect: (path, params = null) ->
    request = @buildRequest(path, params)
    Davis.location.replace(request)

  # Build a request, using the path and/or params from the current URL (replacing any params with new ones)
  buildRequest: (path, params = null) ->
    current = new Davis.Request(Davis.history.current())
    path = current.path or path
    params = if params then _.extend(current.params, params) else current.params

    populatedParams = {}
    for k, v of params
      populatedParams[k] = v if v?

    fullPath = if _.size(populatedParams) > 0
      path + "?" + decodeURIComponent($.param(populatedParams))
    else
      path

    new Davis.Request(fullPath)