'use strict'

angular.module 'animatronApp'
.controller 'ProjectsCtrl', ($scope, projectsSrv) ->
  projectsSrv.getProductsList
    'limit': 9
  .success (data)->
    $scope.projects= data.results
