// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
// import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';
// import 'package:got_app/features/houses_list/presentation/pages/got_houses_page.dart';
// import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';
// import 'package:got_app/features/houses_list/presentation/widgets/house_list_details.dart';

// Route<dynamic>? generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/houses':
//       return MaterialPageRoute(
//         builder: (_) => HousesPage(
//           gotHousesListState: GetIt.I.get<GOTHousesListState>(),
//         ),
//       );
//     case '/house_list_details':
//       final arguments = settings.arguments as Map<String, dynamic>;
//       return MaterialPageRoute(
//         builder: (_) => Material(
//           child: HouseListDetails(
//             membersHouse: arguments['membersHouse'] ?? List<MembersHouseEntity>,
//             imageCharacters:
//                 arguments['imageCharacters'] as List<GetCharactersImageEntity>,
//             title: arguments['title'] ?? '',
//             colorTitle: arguments['colorTitle'] as Color?,
//             imageUrl: arguments['imageUrl'] ?? '',
//             gotHousesStateBackup: GetIt.I.get<GOTHousesListState>(),
//           ),
//         ),
//       );
//     default:
//       return null;
//   }
// }
