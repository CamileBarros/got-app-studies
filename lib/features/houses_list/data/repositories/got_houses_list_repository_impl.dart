import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:got_app/features/houses_list/data/data_source/got_houses_list_data_source.dart';
import 'package:got_app/features/houses_list/data/model/get_characters_image_response_model.dart';
import 'package:got_app/features/houses_list/data/model/get_houses_model_response.dart';
import 'package:got_app/features/houses_list/domain/repositories/got_houses_list_repository.dart';

class GOTHousesListRepositoryImpl implements GOTHousesListRepository {
  final GOTHousesListDatasource gotHousesDataSource;
  final Dio dioClient;

  GOTHousesListRepositoryImpl(
      {required this.gotHousesDataSource, required this.dioClient});

  @override
  Future<List<GetHousesListResponseModel>> getHouses() async {
    try {
      final result = await gotHousesDataSource.getHouses();
      return result;
    } on DioException catch (err) {
      log('Erro ${err.response?.statusCode}');
      rethrow;
    }
  }

  @override
  Future<List<GetCharactersImageResponseModel>> getCharactersImage() async {
    try {
      final result = await gotHousesDataSource.getCharactersImage();
      return result;
    } on DioException catch (err) {
      log('Erro ${err.response?.statusCode}');
      rethrow;
    }
  }
}
