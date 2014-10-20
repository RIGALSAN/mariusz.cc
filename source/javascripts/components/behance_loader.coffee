#= require components/json_loader

class @BehanceLoader
  constructor: (@apiKey, @userId) ->
    @projectsUrl = "http://www.behance.net/v2/users/#{@userId}/projects"
    @wipsUrl = "http://www.behance.net/v2/users/#{@userId}/wips"

  getProjects: (callback) =>
    new JSONLoader @projectsUrl, @apiKey, (data) ->
      _projects = data.projects
      _fmtData = []

      for p in _projects
        _project = {}
        _project.timestamp = p.published_on
        _project.name = p.name
        _project.cover = p.covers['404']
        _project.url = p.url
        _fmtData.push(_project)

      callback(_fmtData)
