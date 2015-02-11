'use strict'

angular.module 'animatronApp'
# On enter event
.directive 'onEnter', ->
  (scope, elm, attr) ->
    elm.bind 'keypress', (e) ->
      if e.keyCode == 13
        attr.onEnter()
      return
    return
