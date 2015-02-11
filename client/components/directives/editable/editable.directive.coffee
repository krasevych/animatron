'use strict'

angular.module 'animatronApp'
.directive 'editableValue', ($timeout) ->
  restrict: 'A'
  templateUrl: 'components/directives/editable/editable.html'
  scope:
    key: '=editableKey'
    value: '=editableValue'
    longTitle: '=editableTitle'
    handleSave: '&onSave'
    handleCancel: '&onCancel'

  link: (scope, elm, attr) ->
    previousValue = undefined

    scope.edit = ->
      scope.editMode = yes
      previousValue = scope.value
      $timeout (->
        elm.find('input')[0].focus()
        return
      ), 0, no
      return

    scope.save = (form)->
      if form.$valid
        scope.editMode = no
        scope.handleSave key:scope.key, value: scope.value
      return

    scope.cancel = ->
      scope.editMode = no
      scope.value = previousValue
      scope.handleCancel value: scope.value
      return

    return
