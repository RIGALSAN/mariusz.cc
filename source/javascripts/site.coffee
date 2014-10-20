#= require bower_components/wow/dist/wow.min
#= require bower_components/handlebars/handlebars.min
#= require vendor/raf-shim.js
#= require_tree ./components

document.addEventListener 'DOMContentLoaded', ->
  behanceAPIKey = 'vaD6q1uzX4vL5ILGaxIBpBWw5FPdLWQJ'
  behanceUserId = 'mariuszciesla'
  dribbbleUserId = 'mariusz'
  work = []

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

  # Pull Behance
  behance = new BehanceLoader behanceAPIKey, behanceUserId
  behance.getProjects
    success: (projects) ->
      work = work.concat(projects)

  # Pull Dribbble
  dribbble = new DribbbleLoader dribbbleUserId, 1, 12
  dribbble.getShots
    success: (shots) ->
      work = work.concat(shots)

      console.log(work)
