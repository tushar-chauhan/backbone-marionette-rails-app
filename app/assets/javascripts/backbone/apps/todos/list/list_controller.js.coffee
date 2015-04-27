@TodoDemo.module 'TodosApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends Marionette.Controller

    initialize: ->
      window.c = @
      App.request 'todos:entities', (todos) =>

        @layout = @getLayoutView()

        @listenTo @layout, 'new:dialog:clicked', (cv) ->
          App.vent.trigger 'new:dialog:clicked', todos

        @listenTo @layout, 'edit:dialog:clicked', (todo) ->
          App.vent.trigger 'edit:dialog:clicked', todo

        @listenTo @layout, 'delete:todo:clicked', (todo) ->
          App.vent.trigger 'delete:todo:clicked', todo
          if confirm "Are you sure you want to delete the todo: '#{todo.get('content')}'?" then todo.destroy() else false

        @listenTo @layout, 'show', =>
          @showInput todos
          @showTodos todos

        App.mainRegion.show @layout

    showInput: (todos) ->
      inputView = @getInputView todos
      @layout.getRegion('input').show inputView

    getInputView: (todos) ->
      new List.Input
        collection: todos

    showTodos: (todos) ->
      todosView = @getTodosView todos
      @layout.getRegion('todos').show todosView

    getTodosView: (todos) ->
      new List.Todos
        collection: todos


    getLayoutView: ->
      new List.LayoutView
