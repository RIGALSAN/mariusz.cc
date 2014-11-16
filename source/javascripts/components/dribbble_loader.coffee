#= require components/ajax
#= require moment/moment

class @DribbbleLoader
  constructor: (@userId, @pages = 1, @per_page = 10) ->
    @shotsUrl = "http://api.dribbble.com/players/#{@userId}/shots"

  getShots: =>
    new Promise (resolve, reject) =>
      request = new ajax
        url: @shotsUrl,
        args:
          api_key: @apiKey,
          pages: @pages,
          per_page: @per_page

      request.get().then (data) ->
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

        resolve(_fmtData)
      , (error) ->
        console.log("Error: ", error)
        reject(error)
