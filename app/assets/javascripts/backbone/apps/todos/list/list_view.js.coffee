@TodoDemo.module 'TodosApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.LayoutView extends App.Views.LayoutView
    template: 'todos/list/templates/list_layout'

    regions:
      input:  '#input-region'
      todos:  '#todos-region'

    childEvents:
      'new:dialog:clicked': (iv) -> @triggerMethod 'new:dialog:clicked'
      'edit:dialog:clicked': (iv, model) -> @triggerMethod 'edit:dialog:clicked', model
      'delete:todo:clicked': (iv, model) -> @triggerMethod 'delete:todo:clicked', model

  class List.Empty extends App.Views.ItemView
    template: 'todos/list/templates/_empty'
    tagName: 'tr'

  class List.Input extends App.Views.ItemView
    template: 'todos/list/templates/_input'
    events:
      'click button#open_dialog': -> @triggerMethod 'new:dialog:clicked'
    collectionEvents:
      'model:created': 'render'
      'model:destroyed': 'render'
      'sync:start': 'showLoader'
      'sync:stop': 'hideLoader'
    showLoader: (model, errors, options) ->
      @$('.loader').show()

    hideLoader: (model, errors, options) ->
      @$('.loader').hide()


  class List.Todo extends App.Views.ItemView
    template: 'todos/list/templates/_todo'
    tagName: 'tr'
    events:
      'click button.edit_dialog': -> @triggerMethod 'edit:dialog:clicked', @model
      'click button.destroy_todo': -> @triggerMethod 'delete:todo:clicked', @model
    modelEvents:
      'updated': 'render'
      'updated': 'highlightRow'
      'created': 'highlightRow'
    collectionEvents:
      'sort': 'render'
    highlightRow: (model, errors, options) ->
      @$el.addClass('highlight')
      setTimeout =>
        @$el.removeClass('highlight')
      , 800

  class List.Todos extends App.Views.CompositeView
    template: 'todos/list/templates/_todos'
    childView: List.Todo
    emptyView: List.Empty
    sort: false
    reorderOnSort: true
    childViewContainer: 'tbody'
    collectionEvents:
      'model:created': 'render'
      'model:updated': 'render'
      'sort': 'render'
