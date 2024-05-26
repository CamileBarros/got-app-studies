import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';
import 'package:got_app/features/houses_list/presentation/widgets/card_button_houses.dart';
import 'package:got_app/features/houses_list/utils/enum/got_houses_list_page_status_enum.dart';

class PageViewHousesCard extends StatelessWidget {
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
            child: CircularProgressIndicator(),
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
              height: MediaQuery.sizeOf(context).height / 2,
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
                              size: EducationalBannerSize.medium,
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  '/house_list_details',
                                  arguments: {
                                    'membersHouse': house.members,
                                    'imageCharacters': gotHousesStateBackup
                                        .imageCharacters.value,
                                    'title': house.name,
                                  },
                                );
                              },
                              description: house.name,
                              colorBanner1:
                                  const Color.fromARGB(255, 1, 59, 106),
                              colorBanner2:
                                  const Color.fromARGB(255, 155, 200, 237),
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
                    color: gotHousesStateBackup.currentPage.value == index ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        );
      });
}
