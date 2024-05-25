import 'package:dio/dio.dart';
import 'package:got_app/features/houses/data/model/get_house_model_response.dart';

abstract class HousesDatasource {
  Future<List<GetHouseModelResponseModel>> getHouses();
}

class HousesDatasourceImpl implements HousesDatasource {
  final Dio dioClient;

  HousesDatasourceImpl({required this.dioClient});

  @override
  Future<List<GetHouseModelResponseModel>> getHouses() async {
    final response = await dioClient.get(
      'https://anapioficeandfire.com/api/houses',
    );
    if (response.statusCode == 200) {
      final List<GetHouseModelResponseModel> result = [];
      response.data.forEach((e) {
        result.add(GetHouseModelResponseModel.fromMap(e));
      });

      return result;
    } else {
      throw Exception('Failed to load houses');
    }
  }
}
