abstract class Injector {
  void registerLazySingleton<T extends Object>(T Function() function);

  void registerSingleton<T extends Object>(T instance);

  void registerFactory<T extends Object>(T Function() function);

  T get<T extends Object>();

  bool isRegistered<T extends Object>({Object? instance, String? instanceName});

  void unregister<T extends Object>();

  Future<void> reset({bool dispose = true});
}
