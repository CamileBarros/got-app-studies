import 'dart:async';

import 'package:got_app/features/core/injection/injection.dart';


abstract class InjectionFeature {
  FutureOr<void> registerDependencies({
    required Injector injector,
  });
}
