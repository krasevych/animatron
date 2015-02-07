'use strict'

angular.module 'animatronApp'
.config ($stateProvider) ->
  $stateProvider.state 'products',
    url: '/products'
    templateUrl: 'app/products/products.html'
    controller: 'ProductsCtrl'
