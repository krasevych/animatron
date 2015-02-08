'use strict'

angular.module 'animatronApp'
.config ($stateProvider) ->
#  get data of projects before start controller
  projectsResolve = ['$q', 'projectsSrv', ($q, projectsSrv)->
    def = do $q.defer
    req = projectsSrv.getProductsList
      'limit': 9
    req.success (data)->
      def.resolve data
    req.error (err)->
      def.reject(err)

    return def.promise
  ]

  $stateProvider
  .state 'projects',
    url: '/projects'
    templateUrl: 'app/projects/projects.html'
    controller: 'ProjectsCtrl'
    resolve:
      projects: projectsResolve

  .state 'modal-project',
    url: '/projects/:id'
    templateUrl: 'app/projects/projects.html'
    controller: 'ProjectsCtrl'
    resolve:
      projects: projectsResolve
    onEnter: ($stateParams, $state, $modal) ->
      redirect = ->
        $state.transitionTo 'projects'
        return

      $modal.open
        templateUrl: 'app/projects/modal-project/modal-project.html'
        controller: 'ModalProjectCtrl'
        windowClass: 'modal-project'
      .result.then redirect, redirect
      return
    onExit: ($rootScope, $modalStack) ->
      $rootScope.$on '$stateChangeStart', ->
        top = $modalStack.getTop()
        if top
          $modalStack.dismiss top.key
        return
      return
