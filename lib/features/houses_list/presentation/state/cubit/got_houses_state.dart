import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';

enum GOTHousesStateEnum {
  loading,
  loaded,
  error,
  charactersImageLoaded,
  pageChanged,
  pageViewController,
}

abstract class GOTHousesState extends Equatable {
  const GOTHousesState();

  @override
  List<Object?> get props => [];
}

class GOTHousesStateData extends GOTHousesState {
  final GOTHousesStateEnum stateEnum;
  final List<GetHousesListEntity> houses;
  final String errorMessage;
  final List<GetCharactersImageEntity> charactersImage;
  final int currentPage;
  final PageController? pageController;
  const GOTHousesStateData({
    required this.stateEnum,
    this.houses = const [],
    this.errorMessage = '',
    this.charactersImage = const [],
    this.currentPage = 0,
    this.pageController,
  });

  @override
  List<Object?> get props => [
        stateEnum,
        houses,
        errorMessage,
        charactersImage,
        currentPage,
        pageController,
      ];
}
