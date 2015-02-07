'use strict'

angular.module 'animatronApp'
.controller 'ProjectsCtrl', ($scope, projectsSrv) ->
  $scope.message = 'Hello'
  $scope.projects= projectsSrv.getProductsList
    'limit': 9
