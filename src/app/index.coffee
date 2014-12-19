angular.module "generator", ['ngCookies', 'ngTouch', 'ngSanitize', 'ngAnimate', 'ngResource', 'famous.angular', 'ui.router']
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html",
        controller: "MainCtrl"

    $urlRouterProvider.otherwise '/'

