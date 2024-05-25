import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_app/features/houses/domain/use_cases/houses_use_case.dart';
import 'package:got_app/features/houses/presentation/state/cubit/houses_state.dart';

class HousesCubit extends Cubit<HousesState> {
  HousesCubit({
    required housesUseCase,
  })  : _housesUseCase = housesUseCase,
        super(HousesInitial());

  final HousesUseCase _housesUseCase;

  Future<void> fetchHouses() async {
    emit(HousesLoading());

    try {
      final houses = await _housesUseCase();
      emit(HousesLoaded(houses));
    } catch (e) {
      emit(HousesError(e.toString()));
    }
  }
}
