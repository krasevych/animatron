'use strict'

describe 'Controller: ModalProjectCtrl', ->

  # load the controller's module
  beforeEach module 'animatronApp'
  ModalProjectCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ModalProjectCtrl = $controller 'ModalProjectCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
