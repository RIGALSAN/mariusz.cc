#= require components/ajax

class @BehanceLoader
  constructor: (@apiKey, @userId) ->
    @projectsUrl = "http://www.behance.net/v2/users/#{@userId}/projects"
    @wipsUrl = "http://www.behance.net/v2/users/#{@userId}/wips"

  getProjects: =>
    new Promise (resolve, reject) =>
      request = new ajax
        url: @projectsUrl,
        args:
          api_key: @apiKey

      request.get().then (data) ->
        _projects = data.projects
        _fmtData = []

        for p in _projects
          _createdAt = new Date(p.published_on * 1000).toISOString()
          _project = {}
          _project.created_at = _createdAt
          _project.name = p.name
          _project.image = p.covers['404']
          _project.url = p.url
          _fmtData.push(_project)
        resolve(_fmtData)
      , (error) ->
        reject(error)
