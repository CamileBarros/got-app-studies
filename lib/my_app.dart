import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';
import 'package:got_app/features/houses_list/presentation/pages/got_house_list_details.dart';
import 'package:got_app/features/houses_list/presentation/pages/got_houses_page.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';

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
        initialRoute: '/houses',
        routes: {
          '/houses': (context) => HousesPage(
                gotHousesStateBackup: GetIt.I.get<GOTHousesListState>(),
              ),
          '/house_list_details': (context) {
            final Map<String, dynamic> arguments = ModalRoute.of(context)
                ?.settings
                .arguments as Map<String, dynamic>;
            final String title = arguments['title'] as String;
            final List<MembersHouseEntity> membersHouse =
                arguments['membersHouse'] as List<MembersHouseEntity>;
            final List<GetCharactersImageEntity> imageCharacters =
                arguments['imageCharacters'] as List<GetCharactersImageEntity>;

            final Color? colorTitle = arguments['colorTitle'] as Color?;

            final String imageUrl = arguments['imageUrl'] as String;

            return HouseListDetailsPage(
              membersHouse: membersHouse,
              imageCharacters: imageCharacters,
              title: title,
              colorTitle: colorTitle,
              imageUrl: imageUrl,
              gotHousesStateBackup: GetIt.I.get<GOTHousesListState>(),
            );
          }
        });
  }
}
