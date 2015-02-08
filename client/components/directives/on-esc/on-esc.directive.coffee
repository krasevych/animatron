'use strict'

angular.module 'animatronApp'
.directive 'onEsc', ->
  (scope, elm, attr) ->
    elm.bind 'keydown', (e) ->
      if e.keyCode == 27
        scope.$apply attr.onEsc
      return
    return
