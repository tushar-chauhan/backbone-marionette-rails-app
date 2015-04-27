@TodoDemo.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Header extends Entities.Model

  class Entities.HeaderCollection extends Entities.Collection
    model: Entities.Header

  API =
    getHeaders: ->
      currentUser = App.request 'get:current:user'
      if(!isNaN(currentUser.get('id')))
        new Entities.HeaderCollection [
          { name: currentUser.get('email'), href: 'javascript:;' }
          { name: 'Logout', href: '/users/sign_out', method: 'DELETE' }
        ]

  App.reqres.setHandler 'header:entities', ->
    API.getHeaders()
