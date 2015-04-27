@TodoDemo.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Todo extends Entities.Model
    urlRoot: -> Routes.todos_path()

  class Entities.TodosCollection extends Entities.Collection
    model: Entities.Todo
    url: -> Routes.todos_path()
    compareISOs: (aISO, bISO) ->
      a = new Date(aISO).getTime()
      b = new Date(bISO).getTime()
      if (a == b)
        return 0
      if (a < b) then 1 else -1

    comparator: (a, b) ->
      # console.log 'sorting..', a.get("updated_at"), b.get("updated_at")
      if a.get('updated_at')
        if b.get('updated_at')
          result = @compareISOs(a.get("updated_at"), b.get("updated_at"))
        else
          result = -1
      result

  API =
    newTodo: ->
      new Entities.Todo

    getTodos: (cb) ->
      todos = new Entities.TodosCollection

      todos.fetch
        reset: true
        success: ->
          cb todos

  App.reqres.setHandler 'todos:entities', (cb) ->
    API.getTodos cb

  App.reqres.setHandler 'new:todo:entity', ->
    API.newTodo()
