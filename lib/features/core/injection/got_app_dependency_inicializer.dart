import 'dart:async';

import 'package:got_app/features/core/injection/got_app_all_dependecy_features.dart';
import 'package:got_app/features/core/injection/got_app_dependency_registry.dart';


abstract class DependencyInitializer {
  FutureOr<void> registerFeatures();
}

class GotAppDependencyInitializer implements DependencyInitializer {
  GotAppDependencyInitializer._();

  static GotAppDependencyInitializer instance = GotAppDependencyInitializer._();

  @override
  FutureOr<void> registerFeatures() async {
    for (final feature in allDependencyFeatures) {
      await feature.registerDependencies(
        injector: DependencyRegistry.I,
      );
    }
  }
}
