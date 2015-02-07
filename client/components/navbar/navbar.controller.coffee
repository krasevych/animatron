'use strict'

angular.module 'animatronApp'
.controller 'NavbarCtrl', ($scope, $location) ->
  $scope.menu = [
    title: 'Home'
    link: '/'
  ,
    title: 'Projects'
    link: '/projects'
  ,
    title: 'About Us'
    link: '/about'
  ]
  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    route is $location.path()
