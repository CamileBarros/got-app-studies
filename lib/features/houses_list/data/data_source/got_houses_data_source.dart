import 'package:dio/dio.dart';
import 'package:got_app/features/houses_list/data/model/get_characters_image_response_model.dart';
import 'package:got_app/features/houses_list/data/model/get_houses_model_response.dart';

abstract class GOTHousesDatasource {
  Future<List<GetHousesListResponseModel>> getHouses();
  Future<List<GetCharactersImageResponseModel>> getCharactersImage();
}

class GOTHousesDatasourceImpl implements GOTHousesDatasource {
  final Dio dioClient;

  GOTHousesDatasourceImpl({required this.dioClient});

  @override
  Future<List<GetHousesListResponseModel>> getHouses() async {
    const url = 'https://api.gameofthronesquotes.xyz/v1/houses';
    final response = await dioClient.get(
      url,
    );
    if (response.statusCode == 200) {
      final List<GetHousesListResponseModel> result = [];
      response.data.forEach((e) {
        result.add(GetHousesListResponseModel.fromMap(e));
      });

      return result;
    } else {
      throw Exception('Failed to load houses list');
    }
  }

  @override
  Future<List<GetCharactersImageResponseModel>> getCharactersImage() async {
    const url = 'https://thronesapi.com/api/v2/Characters';
    final response = await dioClient.get(
      url,
    );
    if (response.statusCode == 200) {
      final List<GetCharactersImageResponseModel> result = [];
      response.data.forEach((e) {
        result.add(GetCharactersImageResponseModel.fromMap(e));
      });

      return result;
    } else {
      throw Exception('Failed to load characters image');
    }
  }
}
