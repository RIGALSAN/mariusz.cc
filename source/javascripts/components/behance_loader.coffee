#= require components/json_loader

class @BehanceLoader
  constructor: (@apiKey, @userId) ->
    @projects = {}
    @wips = {}
    @projectsUrl = "http://www.behance.net/v2/users/#{@userId}/projects"
    @wipsUrl = "http://www.behance.net/v2/users/#{@userId}/wips"

  getData: =>
    @projects = new JSONLoader(@projectsUrl, @apiKey).get()
    @wips = new JSONLoader(@wipsUrl, @apiKey).get()

  getProjects: =>
    @projects

  getWIPs: =>
    @wips
