angular.module "futureSeed"
  .controller "NavbarCtrl", ($scope, $state) ->
    $scope.date = new Date()

    $scope.goHome = ->
      console.log 'going home'
      $state.go 'home'
