import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';
import 'package:got_app/features/houses_list/utils/helpers/got_house_list_details_helper.dart';

class HouseListDetails extends StatelessWidget with GOTHouseListDetailsHelper {
  final List<MembersHouseEntity> membersHouse;
  final List<GetCharactersImageEntity> imageCharacters;
  final GOTHousesListState gotHousesStateBackup;
  final String title;
  final Color? colorTitle;
  final String imageUrl;
  const HouseListDetails(
      {required this.membersHouse,
      required this.imageCharacters,
      required this.title,
      required this.colorTitle,
      required this.imageUrl,
      required this.gotHousesStateBackup,
      super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            textAlign: TextAlign.center,
            title.replaceAll('of ', 'of\n'),
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Cinzel',
              fontWeight: FontWeight.bold,
              color: colorTitle,
            ),
          ),
          Flexible(
            child: ListView.separated(
              itemCount: membersHouse.length,
              itemBuilder: (_, int index) {
                final member = membersHouse[index];

                return ListTile(
                  title: Text(membersHouse[index].name),
                  subtitle: Text(getMemberTitle(member.slug, imageCharacters)),
                  leading: getImageUrl(member.slug, imageCharacters) != ''
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              getImageUrl(member.slug, imageCharacters)),
                        )
                      : const Icon(Icons.person),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 8,
                  color: const Color.fromARGB(255, 236, 233, 233),
                );
              },
            ),
          ),
        ],
      );
}
