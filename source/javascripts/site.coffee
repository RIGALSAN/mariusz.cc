#= require bower_components/wow/dist/wow.min.js
#= require vendor/raf-shim.js
#= require_tree ./components

class ColorSlider
  constructor: (@element, @hue, @saturation, @lightness, @tick) ->
    window.requestAnimationFrame(@draw)

  recalculate: =>
    @hue = if @hue == 360 then 0 else @hue + 1
    @element.style.backgroundColor = "hsla(#{@hue}, #{@saturation}%, #{@lightness}%, .15)"
    window.requestAnimationFrame(@draw)

  draw: =>
    _frameRate = 1000 / @tick
    window.setTimeout(@recalculate, _frameRate)


document.addEventListener 'DOMContentLoaded', ->
  behanceAPIKey = 'vaD6q1uzX4vL5ILGaxIBpBWw5FPdLWQJ'
  behanceUserId = 'mariuszciesla'

  new WOW().init()

  navBtn = document.getElementById('nav_button')
  navBtn.addEventListener 'click', (e) ->
    e.preventDefault()
    nav = document.getElementById('nav')
    nav.classList.toggle('nav--top__visible')

  elOverlay = document.getElementById 'teaser_overlay'
  slider = new ColorSlider(elOverlay, 316, 100, 35, 5)

  loader = new BehanceLoader(behanceAPIKey, behanceUserId)
  console.log('--')
