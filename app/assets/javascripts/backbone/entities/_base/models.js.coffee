@TodoDemo.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Model extends Backbone.Model

    destroy: (options = {}) ->
      _.defaults options,
        wait: true
        success: _.bind(@destroySuccess, @, @collection)

      @set _destroy: true
      super options

    save: (data, options = {}) ->
      isNew = @isNew()

      _.defaults options,
        wait: true
        success:  _.bind(@saveSuccess, @, isNew, options.collection)
        error:    _.bind(@saveError, @)

      @unset '_errors'

      super data, options

    saveSuccess: (isNew, collection) =>
      if(isNew)
        collection.add @ if collection
        collection.trigger 'model:created', @ if collection
        @trigger 'created', @
      else
        collection ?= @collection
        collection.trigger 'model:updated', @ if collection
        @trigger 'updated', @

    saveError: (model, xhr, options) =>
      # Set errors directly on models unless status returned was 500 or 404
      @set _errors: $.parseJSON(xhr.responseText)?.errors unless xhr.status is 500 or xhr.status is 404

    destroySuccess: (collection) =>
      collection.trigger 'model:destroyed', @ if collection
