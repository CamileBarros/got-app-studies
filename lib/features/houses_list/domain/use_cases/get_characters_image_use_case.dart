import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';
import 'package:got_app/features/houses_list/domain/repositories/got_houses_list_repository.dart';

abstract class GetCharactersImageUseCase {
  Future<List<GetCharactersImageEntity>> call();
}

class GetCharactersImageUseCaseImpl implements GetCharactersImageUseCase {
  final GOTHousesListRepository gotHousesRepository;

  GetCharactersImageUseCaseImpl({required this.gotHousesRepository,});

  @override
  Future<List<GetCharactersImageEntity>> call() async {
    final result = await gotHousesRepository.getCharactersImage();
   
    return result;
  }
}
