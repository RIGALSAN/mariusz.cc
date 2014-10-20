#= require bower_components/wow/dist/wow.min.js
#= require vendor/raf-shim.js
#= require_tree ./components

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

  behance = new BehanceLoader(behanceAPIKey, behanceUserId)
