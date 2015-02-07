'use strict'

describe 'Directive: projectsList', ->

  # load the directive's module and view
  beforeEach module 'animatronApp'
  beforeEach module 'components/projects-list/projects-list.html'
  element = undefined
  scope = undefined
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<projects-list></projects-list>'
    element = $compile(element) scope
    scope.$apply()
    expect(element.text()).toBe 'this is the projectsList directive'

