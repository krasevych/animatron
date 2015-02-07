'use strict'

angular.module 'animatronApp'
.directive 'projectsList', ->
  templateUrl: 'components/projects-list/projects-list.html'
  restrict: 'E'
  scope:
    project:'='
  link: (scope, element, attrs) ->
