import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:got_app/features/core/injection/got_app_dependency_inicializer.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';
import 'package:got_app/features/houses_list/presentation/pages/got_houses_page.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_cubit.dart';

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
        home: BlocProvider(
          create: (context) => GOTHousesCubit(
            getHousesUseCase: GetIt.I.get<GetHousesUseCase>(),
            getCharactersImageUseCase: GetIt.I.get<GetCharactersImageUseCase>(),
          ),
          child: const HousesPage(),
        ));
  }
}
