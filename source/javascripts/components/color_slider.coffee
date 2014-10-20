class @ColorSlider
  constructor: (@element, @hue, @saturation, @lightness, @tick) ->
    window.requestAnimationFrame(@draw)

  recalculate: =>
    @hue = if @hue == 360 then 0 else @hue + 1
    @element.style.backgroundColor = "hsla(#{@hue}, #{@saturation}%, #{@lightness}%, .15)"
    window.requestAnimationFrame(@draw)

  draw: =>
    _frameRate = 1000 / @tick
    window.setTimeout(@recalculate, _frameRate)
