class Work
  constructor: ->
    @behanceApiKey = 'tACNfA7aEjSQemgcKI7jYc2Vj1VkxCnD'
    @behanceUserName = 'mariuszciesla'
    @behanceApiURL = 'http://behance.net/v2/users/' + @behanceUserName + '?api_key=' + @behanceApiKey

  getBehance: ->
    console.log @behanceApiURL

    $.getJson @behanceApiURL,
      (data) ->
        console.log data
        items = []
        $.each data, (key, value) ->
          items.push(key + " " + value)

        $('#behance').text(items)
      
