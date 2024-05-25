import 'dart:async';

import 'package:got_app/features/core/injection/app_features.dart';
import 'package:got_app/features/core/injection/app_injector.dart';


abstract class InjectionComponent {
  FutureOr<void> registerFeatures();
}

class AppInjectionComponent implements InjectionComponent {
  AppInjectionComponent._();

  static AppInjectionComponent instance = AppInjectionComponent._();

  @override
  FutureOr<void> registerFeatures() async {
    for (final feature in appInjectionFeatures) {
      await feature.registerDependencies(
        injector: AppInjector.I,
      );
    }
  }
}
