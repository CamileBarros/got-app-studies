import 'package:got_app/features/houses/data/model/get_house_model_response.dart';
import 'package:got_app/features/houses/domain/entities/get_house_entity.dart';

abstract class HousesState {}

class HousesInitial extends HousesState {}

class HousesLoading extends HousesState {}

class HousesLoaded extends HousesState {
  final List<GetHouseEntity> houses;

  HousesLoaded(this.houses);
}

class HousesError extends HousesState {
  final String message;

  HousesError(this.message);
}
