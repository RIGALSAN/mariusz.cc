#= require components/ajax
#= require ../bower_components/moment/moment

class @DribbbleLoader
  constructor: (@userId, @pages = 1, @per_page = 10) ->
    @shotsUrl = "http://api.dribbble.com/players/#{@userId}/shots"

  getShots: (args) =>
    new ajax @shotsUrl,
      api_key: @apiKey,
      pages: @pages,
      per_page: @per_page,
      success: (data) ->
        _shots = data.shots
        _fmtData = []

        for s in _shots
          _createdAt = new Date(s.created_at).toISOString()
          _shot = {}
          _shot.name = s.title
          _shot.url = s.url
          _shot.image = s.image_400_url
          _shot.created_at = _createdAt
          _fmtData.push(_shot)

        args['success'](_fmtData)
