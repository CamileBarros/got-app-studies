import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:got_app/features/houses_list/presentation/widgets/house_list_details.dart';
import 'package:got_app/features/houses_list/presentation/widgets/loading_banner_house.dart';
import 'package:got_app/features/houses_list/utils/helpers/got_house_list_details_helper.dart';

class HouseListDetailsPage extends StatefulWidget with GOTHouseListDetailsHelper {
  final List<MembersHouseEntity> membersHouse;
  final List<GetCharactersImageEntity> imageCharacters;
  final GOTHousesListState gotHousesStateBackup;
  final String title;
  final Color? colorTitle;
  final String imageUrl;
  const HouseListDetailsPage({
    required this.membersHouse,
    required this.imageCharacters,
    required this.title,
    required this.colorTitle,
    required this.imageUrl,
    required this.gotHousesStateBackup,
    super.key,
  });

  @override
  State<HouseListDetailsPage> createState() => _HouseListDetailsState();
}

class _HouseListDetailsState extends State<HouseListDetailsPage> {
  GOTHousesListState get gotHousesStateBackup => widget.gotHousesStateBackup;
  bool showBannerHouse = false;

  @override
  void initState() {
    loadBannerHouse();
    super.initState();
  }

  Future<void> loadBannerHouse() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      showBannerHouse = true;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: widget.getBackgroundColor(
          showBannerHouse,
          widget.colorTitle,
        ),
        appBar: showBannerHouse
            ? GOTAppBar(
                title: widget.title,
              )
            : null,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: showBannerHouse
              ? HouseListDetails(
                  membersHouse: widget.membersHouse,
                  imageCharacters: widget.imageCharacters,
                  title: widget.title,
                  colorTitle: widget.colorTitle,
                  imageUrl: widget.imageUrl,
                  gotHousesStateBackup: gotHousesStateBackup,
                )
              : LoadingBannerHouse(
                  imageUrl: widget.imageUrl,
                ),
        ),
      );
}
