part of injectable_application;

abstract class InjectableAction {
  Future apply(InjectableApplication app, request);

  Future run();
}