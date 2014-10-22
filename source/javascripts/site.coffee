#= require bower_components/wow/dist/wow.min
#= require bower_components/handlebars/handlebars.min
#= require vendor/raf-shim
#= require vendor/keysort
#= require_tree ./components

document.addEventListener 'DOMContentLoaded', ->
  behanceAPIKey = 'vaD6q1uzX4vL5ILGaxIBpBWw5FPdLWQJ'
  behanceUserId = 'mariuszciesla'
  dribbbleUserId = 'mariusz'
  work = []
  workHtml = ""

  new WOW().init()

  navBtn = document.getElementById('nav_button')
  navBtn.addEventListener 'click', (e) ->
    e.preventDefault()
    nav = document.getElementById('nav')
    nav.classList.toggle('nav--top__visible')

  elOverlay = document.getElementById 'teaser_overlay'
  slider = new ColorSlider(elOverlay, 316, 100, 35, 5)

  # Handlebars stuff
  workContainer = document.getElementById("work_container")
  itemSource = document.getElementById("portfolio_item").innerHTML
  itemTemplate = Handlebars.compile(itemSource)

  # Pull work data
  behance = new BehanceLoader behanceAPIKey, behanceUserId
  dribbble = new DribbbleLoader dribbbleUserId, 1, 12

  Promise.all([behance.getProjects(), dribbble.getShots()]).then (response) ->
    console.log("Promises resolved!")
    console.log(response)
