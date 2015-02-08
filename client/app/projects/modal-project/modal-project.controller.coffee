'use strict'

angular.module 'animatronApp'
.controller 'ModalProjectCtrl', ($scope, $stateParams, $window,$modalInstance, projectsSrv) ->
  oldPageTitle=$window.document.title
#  get product via service
  projectsSrv.getProjectById $stateParams.id
  .then (data)->
    $scope.project = data
    $window.document.title = data.name if data.name

#    change title of page, when close modal
  $modalInstance.result.finally ->
    $window.document.title=oldPageTitle

  # handle after clicking Cancel button
  $scope.cancel = ->
    $scope.$dismiss()
    return

