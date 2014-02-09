import 'package:unittest/unittest.dart';

import 'dart:async';
import '../lib/injectable_application.dart';

class ApplicationImpl extends InjectableApplication {
  void prepareRequestModule(Module requestModule, request) {
  }
}

class ControllerImpl extends InjectableController {
  final Map<String, Type> actions = {
    'test': ActionImpl
  };
}

class ActionImpl extends InjectableAction {
  Future apply(InjectableApplication app, request) {
    return run();
  }

  Future run() {
    return new Future.value('ok');
  }
}

void main(){
  test('a simple implementation', () {
    var app = new ApplicationImpl();
    app.run(); //prepare the app
    app.module..type(ControllerImpl);
    app.moduleRequestContext..type(ActionImpl);
    var controller = new ControllerImpl();
    Future result = app.runAction(controller, controller.actions['test'], null);
    result.then(expectAsync1((result) {
      expect(result, 'ok');
    }));
  });
}
