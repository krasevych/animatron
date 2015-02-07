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
#        app/projects/modal-project/modal-project.html
          template: '<div class="modal-header"><h3 class="modal-title">Modal</h3></div><div class="modal-body">The modal body...</div><div class="modal-footer"><button class="btn btn-primary" ng-click="ok()">OK</button><button class="btn btn-warning" ng-click="cancel()">Cancel</button></div>'
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
