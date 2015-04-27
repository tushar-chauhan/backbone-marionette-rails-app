@TodoDemo.module 'TodosApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Todo extends App.Views.FormView
    template: 'todos/edit/templates/edit_todo'

    triggers:
      'submit #edit_todo': 'update:todo'

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
      console.log 'Edit modal destroyed..'
