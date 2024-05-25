

import 'package:get_it/get_it.dart';
import 'package:got_app/features/core/injection/injection.dart';

final _getIt = GetIt.instance;

class AppInjector implements Injector {
  AppInjector._();

  static Injector? _internal;
  static Injector get I => _instance;

  static Injector get _instance {
    _internal ??= AppInjector._();
    return _internal!;
  }

  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void registerFactory<T extends Object>(T Function() function) {
    _getIt.registerFactory<T>(() => function.call());
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() function) {
    _getIt.registerLazySingleton<T>(() => function.call());
  }

  @override
  void registerSingleton<T extends Object>(T instance) =>
      _getIt.registerSingleton<T>(instance);

  @override
  bool isRegistered<T extends Object>({
    Object? instance,
    String? instanceName,
  }) =>
      _getIt.isRegistered<T>(instance: instance, instanceName: instanceName);

  @override
  Future<void> unregister<T extends Object>() async => _getIt.unregister<T>();

  @override
  Future<void> reset({bool dispose = true}) => _getIt.reset(dispose: dispose);
}
