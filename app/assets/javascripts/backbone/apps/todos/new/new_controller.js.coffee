@TodoDemo.module 'TodosApp.New', (New, App, Backbone, Marionette, $, _) ->

  New.Controller =
    newTodo: (collection) ->
      todo = App.request 'new:todo:entity'
      @newTodoView = @getNewTodoView(todo, collection)
      @newTodoView.on 'create:new:todo': (args) ->
        data = Backbone.Syphon.serialize(args.view);
        args.model.save data,
          collection: collection

      collection.on 'model:created': ->
        collection.sort()
        App.getRegion('dialog').destroy @newTodoView

      App.getRegion('dialog').show @newTodoView

    getNewTodoView: (todo,collection) ->
      new New.Todo
        model: todo
        collection: collection

