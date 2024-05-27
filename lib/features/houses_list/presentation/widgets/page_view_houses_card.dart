import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';
import 'package:got_app/features/houses_list/presentation/widgets/card_button_houses.dart';
import 'package:got_app/features/houses_list/utils/helpers/got_house_list_helper.dart';

class PageViewHousesCard extends StatelessWidget with GOTHousesListHelper {
  final GOTHousesListState gotHousesListState;
  const PageViewHousesCard({
    super.key,
    required this.gotHousesListState,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
      valueListenable: gotHousesListState.currentPage,
      builder: (_, currentPage, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.3,
                child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: gotHousesListState.pageController.value,
                    onPageChanged: gotHousesListState.onPageChanged,
                    children: gotHousesListState.housesList.value.map((house) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height / 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: SingleChildScrollView(
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
                                        'imageCharacters': gotHousesListState
                                            .imageCharacters.value,
                                        'title': house.name,
                                        'colorTitle':
                                            getColorByHouseName(house.name),
                                        'imageUrl':
                                            getPathByHouseName(house.name),
                                      },
                                    );
                                  },
                                  imageUrl: getPathByHouseName(house.name),
                                  text: house.name
                                      .replaceAll('House ', 'House\n'),
                                  colorSecondary:
                                      getColorByHouseName(house.name),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList()),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    gotHousesListState.housesList.value.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPage == index
                          ? getColorByHouseName(
                              gotHousesListState.housesList.value[index].name)
                          : Colors.grey,
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        );
      });
}
