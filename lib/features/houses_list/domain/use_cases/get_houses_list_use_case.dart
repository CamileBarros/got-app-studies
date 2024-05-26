import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';
import 'package:got_app/features/houses_list/domain/repositories/got_houses_list_repository.dart';

abstract class GetHousesListUseCase {
  Future<List<GetHousesListEntity>> call();
}

class GetHousesUseCaseImpl implements GetHousesListUseCase {
  final GOTHousesListRepository gotHousesRepository;

  GetHousesUseCaseImpl({required this.gotHousesRepository,});

  @override
  Future<List<GetHousesListEntity>> call() async {
    final result = await gotHousesRepository.getHouses();
   
    return result;
  }
}
