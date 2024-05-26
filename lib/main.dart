import 'package:flutter/material.dart';
import 'package:got_app/features/core/injection/got_app_dependency_inicializer.dart';
import 'package:got_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeInjection();

  runApp(const MyApp());
}

Future<void> initializeInjection() async {
  await GotAppDependencyInitializer.instance.registerFeatures();
}
