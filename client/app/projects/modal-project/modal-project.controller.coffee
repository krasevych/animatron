'use strict'

angular.module 'animatronApp'
.controller 'ModalProjectCtrl', ($scope) ->
  # handle after clicking Cancel button
  $scope.cancel = ->
    $scope.$dismiss()
    return

  # close modal after clicking OK button

  $scope.ok = ->
    $scope.$close true
    return
