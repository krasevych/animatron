'use strict'

angular.module 'animatronApp'
.factory 'projectsSrv', ($resource)->

  # Service logic
  resource = $resource 'project/list',
    'limit':10
    'offset':0
    'sortBy':staff_picked_time
    'sortOrder':desc
    'staff-picks':true

  # Public API here
  getProductsList: ->
    do resource.query
