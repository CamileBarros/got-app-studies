import 'package:got_app/features/houses/domain/entities/get_house_entity.dart';
import 'package:got_app/features/houses/domain/repositories/houses_repository.dart';

abstract class HousesUseCase {
  Future<List<GetHouseEntity>> call();
}

class HouseUseCaseImpl implements HousesUseCase {
  final HousesRepository housesRepository;

  HouseUseCaseImpl({required this.housesRepository});

  @override
  Future<List<GetHouseEntity>> call() async {
    final result = await housesRepository.getHouses();

    return result;
  }
}
