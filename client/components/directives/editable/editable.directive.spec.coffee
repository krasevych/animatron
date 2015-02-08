'use strict'

describe 'Directive: editable', ->

  # load the directive's module and view
  beforeEach module 'animatronApp'
  beforeEach module 'components/directives/editable/editable.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<editable></editable>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the editable directive'

