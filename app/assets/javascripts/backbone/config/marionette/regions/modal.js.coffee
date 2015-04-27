do (Backbone, Marionette) ->
  class Marionette.Region.Dialog extends Marionette.Region
    el: '#dialog'

    initialize: ->
      # console.log 'Custom dialogue region'

    onShow: (view) ->
      @$el.find('#todo_modal').modal('show')
      @$el.find('#todo_modal').on 'hidden.bs.modal', (e) =>
        @currentView.destroy()

    onBeforeDestroy: ->
      @$el.find('#todo_modal').modal('hide')

    onDestroy: ->
      @$el.find('#todo_modal').modal('hide')

