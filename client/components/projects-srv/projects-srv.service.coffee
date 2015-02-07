'use strict'

angular.module 'animatronApp'
.factory 'projectsSrv', ($resource, apiUrl)->

  # Service logic
  resource = new $resource apiUrl + 'project/list',
    'limit': 10
    'offset': 0
    'sortBy': 'staff_picked_time'
    'sortOrder': 'desc'
    'staff-picks': true
  ,
    get:
      cache:true

  # Public API here
  getProductsList: (filters)->
    resource.get filters
