class @JSONLoader
  constructor: (@url) ->
    @data = @refreshData(@url)

  refreshData: ->
    @request = new XMLHttpRequest()
    @request.open('GET', @url, true)

    @request.onload = ->
      if (request.status >= 200 && request.status < 400)
        # Handle success
        @data = JSON.parse(request.responseText)
      else
        throw "Failed loading data"

    @request.onerror = ->
      throw "Failed to connect to the endpoint."

    @request.send()

  get: ->
    @data
