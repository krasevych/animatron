'use strict'

angular.module 'animatronApp'
.factory 'projectsSrv', ($http, $cacheFactory, $q, apiUrl)->

  # Service logic
#   Values
  projects = []
  cache = $cacheFactory 'projects'
  timeDelayClear=300000
  defaultParams =
    'limit': 10
    'offset': 0
    'sortBy': 'staff_picked_time'
    'sortOrder': 'desc'
    'staff-picks': true

  #    Private methods
  getProducts = (params)->
    params = angular.extend defaultParams, params

    req = $http.get apiUrl + 'project/list',
      params: params
      cache: cache

    req.success (data)->
    projects = req

    return req

  clearCache = ->
    cache = $cacheFactory.get 'projects'
    do cache.removeAll if cache

  delayClearCache = _.debounce clearCache, timeDelayClear,
    maxWait: timeDelayClear


  # Public API
  getProductsList: (params)->
    do delayClearCache
    return getProducts params

  getProjectById: (id)->
    def= do $q.defer
    projects.success (data)->
      product = _.findWhere data.results,
        'id': id
      def.resolve product

    console.log def
    return def.promise




