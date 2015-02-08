'use strict'

angular.module 'animatronApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'projects',
    url: '/projects'
    templateUrl: 'app/projects/projects.html'
    controller: 'ProjectsCtrl'

  .state 'modal-project',
    url: '/projects/:id'
    templateUrl: 'app/projects/projects.html'
    controller: 'ProjectsCtrl'
    onEnter: [
      '$stateParams'
      '$state'
      '$modal'
      ($stateParams, $state, $modal) ->
        $modal.open
          templateUrl: 'app/projects/modal-project/modal-project.html'
          controller: 'ModalProjectCtrl'
        .result.then ->
          # change route after clicking OK button
          $state.transitionTo 'projects'
          return
        , ->
          # change route after clicking Cancel button or clicking background
          $state.transitionTo 'projects'
          return
        return
    ]
    onExit:[
      '$rootScope'
      '$modalStack'
      ($rootScope, $modalStack) ->
        $rootScope.$on '$stateChangeStart', ->
          top = $modalStack.getTop()
          if top
            $modalStack.dismiss top.key
          return
        return
    ]
