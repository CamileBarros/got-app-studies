import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';
import 'package:got_app/features/houses_list/presentation/widgets/card_button_houses.dart';

class PageViewHousesCard extends StatelessWidget {
  final GOTHousesStateBackup gotHousesStateBackup;
  const PageViewHousesCard({
    super.key,
    required this.gotHousesStateBackup,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: gotHousesStateBackup.currentPage,
        builder: (_, currentPage, __) => PageView(
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
                        onTap: () {},
                        description: house.name,
                        colorBanner1: const Color.fromARGB(255, 1, 59, 106),
                        colorBanner2: const Color.fromARGB(255, 155, 200, 237),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()));
}
