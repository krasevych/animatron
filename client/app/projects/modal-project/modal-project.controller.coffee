'use strict'

angular.module 'animatronApp'
.controller 'ModalProjectCtrl', ($scope, $stateParams, $window, $modalInstance, projectsSrv) ->
  oldPageTitle = $window.document.title # set title for the window

  # get product via service
  projectsSrv.getProjectById $stateParams.id
  .then (data)->
    $scope.project = data
    $scope.titleShow = data.name
    $window.document.title = data.name if data.name

  # change title of page, when close modal
  $modalInstance.result.finally ->
    $window.document.title = oldPageTitle

  # handle after clicking Cancel button
  $scope.cancel = ->
    $scope.$dismiss()
    return

  # update value after edit
  $scope.update = (key, value)->
    attr={}
    attr[key]=value
    projectsSrv.updateProject attr
    return


