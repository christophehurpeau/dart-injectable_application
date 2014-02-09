part of injectable_application;

abstract class InjectableApplication {
  final Module module = new Module();
  final Module moduleRequestContext = new Module();

  Injector _injector;
  Injector get injector => _injector;

  void run() {
    module.value(InjectableApplication, this);
    module.value(this.runtimeType, this);

    _injector = new DynamicInjector(modules: [module]);

  }

  void prepareRequestModule(Module requestModule, request);

  Future runAction(InjectableController controller, Type actionType, request) {
    var requestModule = new Module();
    prepareRequestModule(requestModule, request);

    var requestContextInjector = injector.createChild(
        controller.module == null ?
            [requestModule, moduleRequestContext]
            : [requestModule, controller.module, moduleRequestContext]
    );

    InjectableAction action = requestContextInjector.get(actionType);
    return action.apply(this, request);
  }

}