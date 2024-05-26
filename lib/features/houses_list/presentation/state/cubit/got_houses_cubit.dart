// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
// import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';
// import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_state.dart';

// class GOTHousesCubit extends Cubit<GOTHousesStateData> {
//   GOTHousesCubit({
//     required this.getHousesUseCase,
//     required this.getCharactersImageUseCase,
//   }) : super(const GOTHousesStateData(stateEnum: GOTHousesStateEnum.loading));

//   final GetHousesListUseCase getHousesUseCase;
//   final GetCharactersImageUseCase getCharactersImageUseCase;

//   Future<void> loadHouses() async {
//     emit(const GOTHousesStateData(stateEnum: GOTHousesStateEnum.loading));
//     try {
//       final houses = await getHousesUseCase();
//       emit(GOTHousesStateData(
//         stateEnum: GOTHousesStateEnum.loaded,
//         houses: houses,
//       ));
//     } catch (e) {
//       emit(GOTHousesStateData(
//         stateEnum: GOTHousesStateEnum.error,
//         errorMessage: e.toString(),
//       ));
//     }
//   }

//   Future<void> loadCharactersImage() async {
//     try {
//       final charactersImage = await getCharactersImageUseCase();
//       emit(GOTHousesStateData(
//         stateEnum: GOTHousesStateEnum.charactersImageLoaded,
//         houses: state.houses,
//         charactersImage: charactersImage,
//       ));
//     } catch (e) {
//       emit(GOTHousesStateData(
//         stateEnum: GOTHousesStateEnum.error,
//         errorMessage: e.toString(),
//       ));
//     }
//   }
// }
