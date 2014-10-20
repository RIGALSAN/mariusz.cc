#= require ../vendor/jsonp.min

class @JSONLoader
  constructor: (@url, @apiKey) ->
    @request = JSONP
      url: @url
      data:
        api_key: @apiKey
      success: (data) ->
        @data = data
      error: (e) ->

  get: ->
    @data
