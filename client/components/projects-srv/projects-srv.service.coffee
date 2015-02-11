'use strict'

angular.module 'animatronApp'
.factory 'projectsSrv', ($http, $cacheFactory, $q, apiUrl)->

  # Service logic
  # Values
  projects = []
  cache = $cacheFactory 'projects'
  timeDelayClear = 300000
  defaultParams =
    'limit': 10
    'offset': 0
    'sortBy': 'staff_picked_time'
    'sortOrder': 'desc'
    'staff-picks': yes

  # Private methods
  getProducts = (params)->
    params = angular.extend defaultParams, params

    projects = $http.get apiUrl + 'project/list',
      params: params
      cache: cache

    return projects

  clearCache = ->
    cache = $cacheFactory.get 'projects'
    do cache.removeAll if cache

  delayClearCache = _.debounce clearCache, timeDelayClear,
    maxWait: timeDelayClear


  # Public API
  getProductsList: (params)->
    do delayClearCache
    return getProducts params

  updateProject: (data)->
    $http.put apiUrl + 'projects', data

  getProjectById: (id)->
    def = do $q.defer
    projects.success (data)->
      product = _.findWhere data.results,
        'id': id
      def.resolve product

    return def.promise




