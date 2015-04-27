@TodoDemo.module 'TodosApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Todo extends App.Views.FormView
    template: 'todos/new/templates/new_todo'
    triggers:
      'submit #new_todo': 'create:new:todo'

    modelEvents:
      'change:_errors': 'changeErrors'
      'sync:start'    : 'showLoader'
      'sync:stop'     : 'hideLoader'

    changeErrors: (model, errors, options) ->
      if _.isEmpty(errors)
        @$('.has-error').removeClass('has-error').find('small').remove()
      else
        for name, array of errors
          @addError name, array[0]

    addError: (name, error) ->
      el = @$("[name='#{name}']")
      sm = $('<small>').text(error)
      el.after(sm).closest('.form-group').addClass('has-error')

    onDestroy: ->
      console.log 'New modal destroyed..'
