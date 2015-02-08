'use strict'

angular.module 'animatronApp'
.controller 'ProjectsCtrl', ($scope, projects) ->
  $scope.projects= projects.results
