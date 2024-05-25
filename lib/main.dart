import 'package:flutter/material.dart';
import 'package:got_app/features/core/injection/got_app_dependency_inicializer.dart';
import 'package:got_app/features/houses_list/presentation/pages/got_houses_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initializeInjection();

  runApp(const MyApp());
}

Future<void> initializeInjection() async {
  await GotAppDependencyInitializer.instance.registerFeatures();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HousesPage(),
    );
  }
}
