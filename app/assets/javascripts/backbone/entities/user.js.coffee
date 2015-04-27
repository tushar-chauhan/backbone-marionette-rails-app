@TodoDemo.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.User extends Entities.Model

  API =
    setCurrentUser: (current_user) ->
      new Entities.User current_user


  App.reqres.setHandler 'set:curent:user', (current_user) ->
    API.setCurrentUser current_user
