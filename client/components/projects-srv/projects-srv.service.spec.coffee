'use strict'

describe 'Service: projectsSrv', ->

  # load the service's module
  beforeEach module 'animatronApp'

  # instantiate service
  projectsSrv = undefined
  beforeEach inject (_projectsSrv_) ->
    projectsSrv = _projectsSrv_

  it 'should do something', ->
    expect(!!projectsSrv).toBe true