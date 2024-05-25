

import 'package:get_it/get_it.dart';
import 'package:got_app/features/core/injection/injection.dart';

final _getIt = GetIt.instance;

class DependencyRegistry implements Injector {
  DependencyRegistry._();

  static Injector? _internal;
  static Injector get I => _instance;

  static Injector get _instance {
    _internal ??= DependencyRegistry._();
    return _internal!;
  }

  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void registerFactory<T extends Object>(T Function() function) {
    _getIt.registerFactory<T>(() => function.call());
  }

  @override
  Future<void> unregister<T extends Object>() async => _getIt.unregister<T>();

}
