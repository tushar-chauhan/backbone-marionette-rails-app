@TodoDemo.module 'HeaderApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Header extends App.Views.ItemView
    template: 'header/show/templates/_header'
    tagName: 'li'

  class Show.Headers extends App.Views.CompositeView
    template: 'header/show/templates/headers'
    childView: Show.Header
    childViewContainer: 'ul'
