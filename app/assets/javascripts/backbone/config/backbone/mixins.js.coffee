do (Backbone) ->
  _.mixin
    capitalize : (s) ->
      s[0].toUpperCase() + s.substring(1).toLowerCase()

    pluralize : (num, singular, plural) ->
      return "<b>#{num}</b> #{singular}s" if num == 0
      return "<b>#{num}</b> #{singular}" if num <= 1
      return "<b>" + num + "</b> " + (plural ? singular + 's')
