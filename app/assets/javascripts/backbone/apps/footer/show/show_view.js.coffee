@TodoDemo.module 'FooterApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Footer extends App.Views.ItemView
    tagName: 'span'
    template: 'footer/show/templates/show_footer'
