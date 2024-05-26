import 'package:got_app/features/houses_list/data/model/get_characters_image_response_model.dart';
import 'package:got_app/features/houses_list/data/model/get_houses_model_response.dart';

abstract class GOTHousesListRepository {
  Future<List<GetHousesListResponseModel>> getHouses();
  Future<List<GetCharactersImageResponseModel>> getCharactersImage();
}
