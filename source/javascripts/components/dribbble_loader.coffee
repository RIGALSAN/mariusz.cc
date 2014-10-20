#= require components/json_loader

class @DribbbleLoader
  constructor: (@apiKey, @userId) ->
    @shotsUrl = "http://api.dribbble.com/players#{@userId}/shots"

  getProjects: (callback) =>
    new JSONLoader @shortsUrl, @apiKey, (data) ->
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
