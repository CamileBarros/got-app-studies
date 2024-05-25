import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:collection/src/iterable_extensions.dart';

class HouseListDetails extends StatelessWidget {
  final List<MembersHouseEntity> membersHouse;
  final List<GetCharactersImageEntity> imageCharacters;
  final String title;
  const HouseListDetails(
      {required this.membersHouse,
      required this.imageCharacters,
      super.key,
      required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: GOTAppBar(
        title: title,
      ),
      body: Builder(builder: (context) {
        if (membersHouse.isEmpty) {
          return const Center(
            child: Text('No houses available'),
          );
        }
        return ListView.separated(
          itemCount: membersHouse.length,
          itemBuilder: (_, int index) {
            final member = membersHouse[index];

            final imageUrl = imageCharacters
                    .firstWhereOrNull((element) =>
                        element.firstName.toLowerCase() ==
                        member.slug.toLowerCase())
                    ?.imageUrl ??
                '';

            return ListTile(
              title: Text(membersHouse[index].name),
              subtitle: Text(membersHouse[index].slug),
              leading: imageUrl != ''
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    )
                  : const Icon(Icons.person),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 8,
              color: Colors.grey,
            );
          },
        );
      }));
}
