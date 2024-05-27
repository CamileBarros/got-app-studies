import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';
import 'package:got_app/features/houses_list/utils/enum/got_houses_list_page_status_enum.dart';

class GOTHousesListState {
  GOTHousesListState({
    required this.getHousesUseCase,
    required this.getCharactersImageUseCase,
  });
  final GetHousesListUseCase getHousesUseCase;
  final GetCharactersImageUseCase getCharactersImageUseCase;

  ValueNotifier<List<GetHousesListEntity>> housesList =
      ValueNotifier<List<GetHousesListEntity>>([]);
  ValueNotifier<List<GetCharactersImageEntity>> imageCharacters =
      ValueNotifier<List<GetCharactersImageEntity>>([]);
  ValueNotifier<GOTHousesListPageStateEnum> statusPage =
      ValueNotifier(GOTHousesListPageStateEnum.initial);
  ValueNotifier<String> errorMessage = ValueNotifier('');
  ValueNotifier<int> currentPage = ValueNotifier<int>(0);
  ValueNotifier<PageController> pageController =
      ValueNotifier<PageController>(PageController());

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void setStatusPage(GOTHousesListPageStateEnum status) {
    statusPage.value = status;
  }

  Future<void> getHouses() async {
    final result = await getHousesUseCase.call();

    try {
      if (result.isNotEmpty) {
        housesList.value = result;
      } else {
        errorMessage.value = 'Error to get houses';
        setStatusPage(GOTHousesListPageStateEnum.error);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      setStatusPage(GOTHousesListPageStateEnum.error);
    }
  }

  Future<void> getCharactersImage() async {
    final result = await getCharactersImageUseCase.call();

    try {
      if (result.isNotEmpty) {
        imageCharacters.value = result;
      } else {
        errorMessage.value = 'Error to get characters image';
        setStatusPage(GOTHousesListPageStateEnum.error);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      setStatusPage(GOTHousesListPageStateEnum.error);
    }
  }

  Future<void> loadData() async {
    setStatusPage(GOTHousesListPageStateEnum.loading);
    await getHouses();
    await getCharactersImage();
    if (housesList.value.isNotEmpty && imageCharacters.value.isNotEmpty) {
      setStatusPage(GOTHousesListPageStateEnum.loaded);
    }
  }
}
