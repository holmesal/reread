angular.module "futureSeed", [
    'ngCookies'
    'ngTouch'
    'ngSanitize'
    'ngAnimate'
    'restangular'
    'famous.angular'
    'ui.router'
    'ts.sheets']
  .config ($stateProvider, $urlRouterProvider, $mediaProvider, $famousProvider) ->

    # States and routes
    $stateProvider
      .state "home",
        url: "/",
        templateUrl: "app/main/main.html",
        controller: "MainCtrl"

    $urlRouterProvider.otherwise '/'

    # Sheets config
    $famous = $famousProvider.$get()

    FAMOUS_FIELD_HANDLERS = [

        field: 'transform',
        handlerFn: (element, payloadFn) ->
          isolate = $famous.getIsolate angular.element(element).scope()
          isolate.modifier.transformFrom payloadFn
      ,
        field: 'size',
        handlerFn: (element, payloadFn) ->
          isolate = $famous.getIsolate angular.element(element).scope()
          isolate.modifier.sizeFrom payloadFn
      ,
        field: 'origin',
        handlerFn: (element, payloadFn) ->
          isolate = $famous.getIsolate angular.element(element).scope()
          isolate.modifier.originFrom payloadFn
      ,
        field: 'align',
        handlerFn: (element, payloadFn) ->
          isolate = $famous.getIsolate angular.element(element).scope()
          isolate.modifier.alignFrom payloadFn
      ,
        field: 'opacity',
        handlerFn: (element, payloadFn) ->
          isolate = $famous.getIsolate angular.element(element).scope()
          console.log isolate
          isolate.modifier.opacityFrom payloadFn
      ,
        field: 'options',
        handlerFn: (element, payloadFn) ->
          throw new Error 'unimplemented: cannot yet set options through Sheets'
    ]

    for handler in FAMOUS_FIELD_HANDLERS
      $mediaProvider.$registerFieldHandler handler.field, handler.handlerFn