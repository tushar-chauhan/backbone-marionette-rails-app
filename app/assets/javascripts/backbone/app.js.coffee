@TodoDemo = do(Backbone, Marionette) ->
  App = new Marionette.Application

  App.rootRoute = Routes.todos_path()

  App.on 'before:start', (options) ->
    @currentUser = App.request 'set:curent:user', options.currentUser

  App.reqres.setHandler 'get:current:user', ->
    App.currentUser

  App.addRegions
    headerRegion: '#header-region'
    mainRegion: '#main-region'
    dialog: Marionette.Region.Dialog
    footerRegion: '#footer-region'

  App.on 'start', ->
    App.module('HeaderApp').start()
    App.module('FooterApp').start()
    App.module('TodosApp').start()

    if Backbone.history
      Backbone.history.start()
      @navigate(@rootRoute, {trigger: true}) if @getCurrentRoute() is ''

  App
