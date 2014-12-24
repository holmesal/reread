angular.module "futureSeed"
  .controller "ParticlesCtrl", ($scope, $famous, $media) ->

    # famo.us imports
    Transitionable = $famous['famous/transitions/Transitionable']
    EventHandler = $famous['famous/core/EventHandler']