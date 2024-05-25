import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_state.dart';

class GOTHousesCubit extends Cubit<GOTHousesState> {
  GOTHousesCubit({
    required housesUseCase,
    required charactersImageUseCase,
  })  : _getHousesUseCase = housesUseCase,
        _getcharactersImageUseCase = charactersImageUseCase,
        super(GOTHousesInitial());

  final GetHousesUseCase _getHousesUseCase;
  final GetCharactersImageUseCase _getcharactersImageUseCase;

  Future<void> getHouses() async {
    emit(GOTHousesLoading());

    try {
      final houses = await _getHousesUseCase();
      emit(GOTHousesLoaded(houses));
    } catch (e) {
      emit(HousesError(e.toString()));
    }
  }

  Future<void> getCharactersImage() async {
    emit(GOTHousesLoading());

    try {
      final charactersImage = await _getcharactersImageUseCase();
      emit(GOTHousesCharactersImageLoaded(charactersImage));
    } catch (e) {
      emit(HousesError(e.toString()));
    }
  }

   void onPageChanged(int value) {
    emit(PageChanged(value));
  }
}
