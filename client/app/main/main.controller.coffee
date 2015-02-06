'use strict'

angular.module 'animatronApp'
.controller 'MainCtrl', ($scope, $http) ->
  $scope.awesomeThings = []

  $http.get('/api/things').success (awesomeThings) ->
    $scope.awesomeThings = awesomeThings
    

