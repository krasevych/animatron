'use strict'

describe 'Controller: ProductsCtrl', ->

  # load the controller's module
  beforeEach module 'animatronApp'
  ProductsCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ProductsCtrl = $controller 'ProductsCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
