#= require ../vendor/jsonp.min

class @JSONLoader
  constructor: (@url, @apiKey, callback) ->
    @request = JSONP
      url: @url
      data:
        api_key: @apiKey
      success: (data) ->
        callback(data)
      error: (e) ->
        throw "Error: #{e}"
