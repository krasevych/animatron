'use strict'

angular.module 'animatronApp'
# On enter event
.directive 'onEnter', ->
  (scope, elm, attr) ->
    elm.bind 'keypress', (e) ->
      if e.keyCode == 13
        scope.$apply attr.onEnter
      return
    return
