import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:got_app/features/houses/data/data_source/houses_data_source.dart';
import 'package:got_app/features/houses/data/model/get_house_model_response.dart';
import 'package:got_app/features/houses/domain/repositories/houses_repository.dart';

class HousesRepositoryImpl implements HousesRepository {
  final HousesDatasourceImpl housesDataSource;
  final Dio dioClient;

  HousesRepositoryImpl(
      {required this.housesDataSource, required this.dioClient});

  @override
  Future<List<GetHouseModelResponseModel>> getHouses() async {
    try {
      final result = await housesDataSource.getHouses();
      return result;
    } on DioException catch (err) {
      log('Erro ${err.response?.statusCode}');
      rethrow;
    }
  }
}
