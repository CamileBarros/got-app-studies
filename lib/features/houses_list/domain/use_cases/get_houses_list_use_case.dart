import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';
import 'package:got_app/features/houses_list/domain/repositories/got_houses_repository.dart';

abstract class GetHousesUseCase {
  Future<List<GetHousesListEntity>> call();
}

class GetHousesUseCaseImpl implements GetHousesUseCase {
  final GOTHousesRepository gotHousesRepository;

  GetHousesUseCaseImpl({required this.gotHousesRepository,});

  @override
  Future<List<GetHousesListEntity>> call() async {
    final result = await gotHousesRepository.getHouses();
   
    return result;
  }
}
