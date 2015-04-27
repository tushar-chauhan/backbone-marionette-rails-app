@TodoDemo.module 'TodosApp', (TodosApp, App, Backbone, Marionette, $, _) ->

  class TodosApp.Router extends Marionette.AppRouter
    appRoutes:
      'todos': 'list'

  API =
    list: ->
      new TodosApp.List.Controller
    new: (collection) ->
      new TodosApp.New.Controller(collection)
    edit: (todo) ->
      new TodosApp.Edit.Controller(todo)

  App.vent.on 'new:dialog:clicked', (todos) ->
    API.new(todos)

  App.vent.on 'edit:dialog:clicked', (todo) ->
    API.edit(todo)

  App.on 'before:start', ->
    new TodosApp.Router
      controller: API
