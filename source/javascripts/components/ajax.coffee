#= require ../vendor/jsonp.min

class @ajax
  constructor: (@url, args) ->
    @request = JSONP
      url: @url
      data: args || {}
      success: (data) ->
        throw 'Error: data is undefined' if typeof data == 'undefined'
        args['success'](data)
      error: (e) ->
        throw e
