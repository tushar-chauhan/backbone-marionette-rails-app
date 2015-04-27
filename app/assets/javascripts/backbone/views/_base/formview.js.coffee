@TodoDemo.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  class Views.FormView extends Marionette.ItemView

    showLoader: (model, errors, options) ->
      @$('button[type=submit]').text(@getEnabledButtonText())
      @$('button[type=submit]').attr('disabled', true)
      @$('.loader').show()

    hideLoader: (model, errors, options) ->
      @$('button[type=submit]').text(@getDisabledButtonText())
      @$('button[type=submit]').attr('disabled', false)
      @$('.loader').hide()

    getEnabledButtonText: ->
      txt = @$('button[type=submit]').text()
      if txt == 'Create'
        txt = 'Creating..'
      else
        txt = 'Updating..'
      txt

    getDisabledButtonText: ->
      txt = @$('button[type=submit]').text()
      if txt == 'Creating..'
        txt = 'Create'
      else
        txt = 'Update'
      txt
