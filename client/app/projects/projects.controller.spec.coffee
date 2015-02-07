'use strict'

describe 'Controller: ProjectsCtrl', ->

  # load the controller's module
  beforeEach module 'animatronApp'
  ProjectsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ProjectsCtrl = $controller 'ProjectsCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
