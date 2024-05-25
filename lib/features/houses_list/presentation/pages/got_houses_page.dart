import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:got_app/features/houses_list/data/data_source/got_houses_data_source.dart';
import 'package:got_app/features/houses_list/data/repositories/got_houses_repository_impl.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_cubit.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_state.dart';
import 'package:got_app/features/houses_list/presentation/widgets/card_button_houses.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  final GetHousesUseCase housesListUseCase = GetIt.instance<GetHousesUseCase>();
  final GetCharactersImageUseCase charactersImageUseCase =
      GetIt.instance<GetCharactersImageUseCase>();
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final housesCubit = GOTHousesCubit(
        housesUseCase: housesListUseCase,
        charactersImageUseCase: charactersImageUseCase);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Game of Thrones Houses',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (_) => housesCubit..getHouses(),
        child: BlocBuilder<GOTHousesCubit, GOTHousesState>(
          builder: (context, state) {
            if (state is GOTHousesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GOTHousesLoaded) {
              return PageView(
                controller: _pageController,
                onPageChanged: housesCubit.onPageChanged,
                children: state.houses
                    .map((house) => SizedBox(
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
                                  colorBanner1:
                                      const Color.fromARGB(255, 1, 59, 106),
                                  colorBanner2:
                                      const Color.fromARGB(255, 155, 200, 237),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              );
            } else if (state is HousesError) {
              return Center(child: Text('Erro: ${state.message}'));
            } else {
              return const Center(child: Text('Nenhum dado disponível'));
            }
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(Icons.chevron_left_outlined),
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                icon: const Icon(Icons.chevron_right_outlined),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
