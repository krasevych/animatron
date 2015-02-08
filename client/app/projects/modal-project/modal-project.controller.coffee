'use strict'

angular.module 'animatronApp'
.controller 'ModalProjectCtrl', ($scope, $stateParams, projectsSrv) ->

#  get product via service
  projectsSrv.getProjectById $stateParams.id
  .then (data)->
    $scope.project = data

  # handle after clicking Cancel button
  $scope.cancel = ->
    $scope.$dismiss()
    return

  # close modal after clicking OK button

  $scope.ok = ->
    $scope.$close true
    return
