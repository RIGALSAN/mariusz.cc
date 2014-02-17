#= require vendor/jquery-2.0.3.min
#= require components/work

class Work
  constructor: ->
    @behanceApiKey = 'tACNfA7aEjSQemgcKI7jYc2Vj1VkxCnD'
    @behanceUserName = 'mariuszciesla'
    @behanceApiURL = 'http://behance.net/v2/users/' + @behanceUserName + '?api_key=' + @behanceApiKey + '&callback=?'

  getBehance: ->
    console.log @behanceApiURL

    $.getJSON
      url: @behanceApiURL
      success: (data) ->
        console.log 'Woot'
      error: (errorMsg) ->
        console.log errorMsg

$ ->
  w = new Work
  w.getBehance()
