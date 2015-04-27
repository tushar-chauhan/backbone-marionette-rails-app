@TodoDemo.module 'TodosApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  Edit.Controller =

    editTodo: (todo) ->
      todo.on 'all', (e) -> console.log e
      @editTodoView = @getEditTodoView(todo)

      @editTodoView.on 'update:todo': (args) ->
        data = Backbone.Syphon.serialize(args.view);
        console.log data
        args.model.save data,
          patch: true

      todo.collection.on 'model:updated': ->
        todo.collection.sort()
        App.getRegion('dialog').destroy @editTodoView

      App.getRegion('dialog').show @editTodoView

    getEditTodoView: (todo) ->
      new Edit.Todo
        model: todo
        collection: todo.collection
