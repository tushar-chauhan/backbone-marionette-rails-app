@TodoDemo.module 'TodosApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends Marionette.Controller

    initialize: (todo) ->
      # todo.on 'all', (e) -> console.log e
      @editTodoView = @getEditTodoView(todo)

      @listenTo @editTodoView, 'update:todo': (args) ->
        data = Backbone.Syphon.serialize(args.view);
        args.model.save data,
          patch: true

      todo.collection.on 'model:updated': ->
        @sort()
        App.getRegion('dialog').destroy @editTodoView

      App.getRegion('dialog').show @editTodoView

    getEditTodoView: (todo) ->
      new Edit.Todo
        model: todo
        collection: todo.collection
