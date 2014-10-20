#= require components/json_loader

class @BehanceLoader
  constructor: (@apiKey, @userId) ->
    @projects = {}
    @wips = {}
    @projectsUrl = 'http://www.behance.net/v2/users/' + @userId + '/projects.json?api_key=' + @apiKey
    @wipsUrl = 'http://www.behance.net/v2/users/' + @userId + '/wips.json?api_key=' + @apiKey
    @getProjects()
    @getWips()

  getProjects: =>
    loader = new JSONLoader(@projectsUrl)
    @projects = loader.get()

  getWips: =>
    loader = new JSONLoader(@wipsUrl)
    @wips = loader.get()
