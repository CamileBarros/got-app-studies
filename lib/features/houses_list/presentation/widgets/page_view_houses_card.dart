import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';
import 'package:got_app/features/houses_list/presentation/widgets/card_button_houses.dart';
import 'package:got_app/features/houses_list/utils/enum/got_houses_list_page_status_enum.dart';
import 'package:got_app/features/houses_list/utils/enum/houses_enum.dart';
import 'package:got_app/features/houses_list/utils/helpers/got_house_list_helper.dart';
import 'package:lottie/lottie.dart';

class PageViewHousesCard extends StatelessWidget with GOTHousesListHelper {
  final GOTHousesStateBackup gotHousesStateBackup;
  const PageViewHousesCard({
    super.key,
    required this.gotHousesStateBackup,
  });

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: Listenable.merge([
        gotHousesStateBackup.statusPage,
        gotHousesStateBackup.currentPage,
      ]),
      builder: (_, __) {
        if (gotHousesStateBackup.statusPage.value ==
            GOTHousesListPageStateEnum.loading) {
          return const Center(
            child:Image(
                image: AssetImage('assets/images/icon_loading.gif'),
                fit: BoxFit.cover,
              ),
          );
        } else if (gotHousesStateBackup.statusPage.value ==
            GOTHousesListPageStateEnum.error) {
          return Center(
            child: Text(gotHousesStateBackup.errorMessage.value),
          );
        }

        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.5,
              child: PageView(
                  controller: gotHousesStateBackup.pageController.value,
                  onPageChanged: gotHousesStateBackup.onPageChanged,
                  children: gotHousesStateBackup.housesList.value.map((house) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Game of Thrones\nHouses',
                              style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Cinzel',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Das terras geladas do Norte às ensolaradas\nde Dorne, a complexa rede de alianças e\nrivalidades determina o destino dos reinos.\n\nDescubra mais sobre as famílias nobres que\ndisputam o Trono de Ferro e desvende os\nsegredos por trás de suas histórias.',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'RobotoSlab',
                              ),
                            ),
                            const SizedBox(height: 32),
                            CardButtonHouses(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/house_list_details',
                                  arguments: {
                                    'membersHouse': house.members,
                                    'imageCharacters': gotHousesStateBackup
                                        .imageCharacters.value,
                                    'title': house.name,
                                    'colorTitle':
                                        getColorByHouseName(house.name),
                                    'imageUrl': getPathByHouseName(house.name),
                                  },
                                );
                              },
                              imageUrl: getPathByHouseName(house.name),
                              description:
                                  house.name.replaceAll('House ', 'House\n'),
                              colorBanner1: const Color.fromARGB(255, 243, 243, 243),
                              colorBanner2: getColorByHouseName(house.name),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  gotHousesStateBackup.housesList.value.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: gotHousesStateBackup.currentPage.value == index
                        ? getColorByHouseName(
                            gotHousesStateBackup.housesList.value[index].name)
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        );
      });
}
