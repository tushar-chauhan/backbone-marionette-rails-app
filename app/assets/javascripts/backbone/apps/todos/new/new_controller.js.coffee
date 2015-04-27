@TodoDemo.module 'TodosApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Controller extends Marionette.Controller

    initialize: (collection) ->
      todo = App.request 'new:todo:entity'
      @newTodoView = @getNewTodoView(todo, collection)
      @listenTo @newTodoView, 'create:new:todo': (args) ->
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

