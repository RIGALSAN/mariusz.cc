#= require ../vendor/jsonp.min

class @ajax
  constructor: (args) ->
    @_url = args['url']
    @_args = args['args']

  get: ->
    new Promise (resolve, reject) =>
      request = JSONP
        url: @_url,
        data: @_args,
        success: (response) ->
          resolve(response)
        error: (response) ->
          reject(response)
