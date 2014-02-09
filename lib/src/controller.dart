part of injectable_application;

abstract class InjectableController {
  Module get module => null;
  Map<String, Type> get actions;
}