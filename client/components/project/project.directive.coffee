'use strict'

angular.module 'animatronApp'
.directive 'project', ->
  templateUrl: 'components/project/project.html'
  restrict: 'E'
  scope:
    project:'='
  controller: ($scope, $http)->

  link: (scope, element, attrs) ->
