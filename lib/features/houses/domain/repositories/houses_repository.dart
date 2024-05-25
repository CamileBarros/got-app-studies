import 'package:got_app/features/houses/data/model/get_house_model_response.dart';

abstract class HousesRepository {
  Future<List<GetHouseModelResponseModel>> getHouses();
}
