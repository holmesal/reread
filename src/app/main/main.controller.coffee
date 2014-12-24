angular.module "futureSeed"
  .controller "MainCtrl", ($scope, $famous, $media, $state) ->

    # famo.us imports
    Transitionable = $famous['famous/transitions/Transitionable']
    EventHandler = $famous['famous/core/EventHandler']

    $scope.colors = ['#7B68EE', '#9400D3', '#FF4500', '#00BFFF', '#5F9EA0']

    $scope.projects = [
        'name': 'something',
        'icon': 'octoface',
        'state': 'particles'
      ,
        'name': 'that\'s',
        'icon': 'microscope',
        'state': 'else'
      ,
        'name': 'worth',
        'icon': 'broadcast',
        'state': 'worth'
      ,
        'name': 'showing',
        'icon': 'package',
        'state': 'showing'
    ]
    angular.forEach $scope.awesomeThings, (awesomeThing) ->
      awesomeThing.rank = Math.random()

    $scope.scroller = new EventHandler

    $scope.options =
      grid:
        dimensions: [2,2]
      scrollview:
        direction: 0
        paginated: false


    $scope.translateY = new Transitionable 0
    $scope.enter = ($done) ->
      $scope.translateY.set 3.14
      $scope.translateY.set 0,
        duration: 300
        curve: 'easeInOut'
      , $done

    $scope.leave = ($done) ->
      $scope.translateY.set 3.14,
        duration: 300
        curve: 'easeInOut'
      , $done

    $scope.changeState = (state) ->
      $state.go state

    $media.$sheet 'MainSheet',

      sm:
        '#wat':
          opacity: ->
            return 0.25
      
