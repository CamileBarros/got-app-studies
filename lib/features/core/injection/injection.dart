abstract class Injector {
  T get<T extends Object>();

  void registerFactory<T extends Object>(T Function() function);

  void unregister<T extends Object>();
}
