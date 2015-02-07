'use strict'

angular.module 'animatronApp'
.config ($stateProvider) ->
  $stateProvider.state 'projects',
    url: '/projects'
    templateUrl: 'app/projects/projects.html'
    controller: 'ProjectsCtrl'
