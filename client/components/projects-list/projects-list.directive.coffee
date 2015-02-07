'use strict'

angular.module 'animatronApp'
.directive 'projectsList', ->
  templateUrl: 'components/projects-list/projects-list.html'
  restrict: 'E'
  scope:
    project:'='
  controller: ($scope, $http)->
    console.log $scope.project.preview_metadata[0]

  link: (scope, element, attrs) ->
