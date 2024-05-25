import 'package:equatable/equatable.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';

abstract class GOTHousesState extends Equatable {
  const GOTHousesState();
  
  @override
  List<Object?> get props => [];
}

class GOTHousesInitial extends GOTHousesState {}

class GOTHousesLoading extends GOTHousesState {}

class GOTHousesLoaded extends GOTHousesState {
  final List<GetHousesListEntity> houses;

  const GOTHousesLoaded(this.houses);

  @override
  List<Object?> get props => [houses];
}

class GOTHousesCharactersImageLoaded extends GOTHousesState {
  final List<GetCharactersImageEntity> charactersImage;

  const GOTHousesCharactersImageLoaded(this.charactersImage);

  @override
  List<Object?> get props => [charactersImage];
}

class HousesError extends GOTHousesState {
  final String message;

  const HousesError(this.message);

  @override
  List<Object?> get props => [message];
}
class PageChanged extends GOTHousesState {
  final int currentPage;

  const PageChanged(this.currentPage);
}