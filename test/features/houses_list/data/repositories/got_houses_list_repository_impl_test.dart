import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:got_app/features/houses_list/data/data_source/got_houses_list_data_source.dart';
import 'package:got_app/features/houses_list/data/model/get_characters_image_response_model.dart';
import 'package:got_app/features/houses_list/data/model/get_houses_model_response.dart';
import 'package:got_app/features/houses_list/data/model/members_house_model.dart';
import 'package:got_app/features/houses_list/data/repositories/got_houses_list_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockGOTHousesDatasource extends Mock implements GOTHousesListDatasource {}

void main() {
  late MockGOTHousesDatasource mockGOTHousesDatasource;
  late MockDio mockDio;
  late GOTHousesListRepositoryImpl gotHousesListRepositoryImpl;

  setUp(() {
    mockDio = MockDio();
    mockGOTHousesDatasource = MockGOTHousesDatasource();
    gotHousesListRepositoryImpl = GOTHousesListRepositoryImpl(
      gotHousesDataSource: mockGOTHousesDatasource,
      dioClient: mockDio,
    );
  });

  group('When calls is 200', () {
    setUp(() {
      when(() => mockGOTHousesDatasource.getHouses()).thenAnswer((_) async => [
            const GetHousesListResponseModel(
                slug: 'slug',
                name: 'name',
                members: [MembersHouseModel(name: 'name', slug: 'slug')])
          ]);
      when(() => mockGOTHousesDatasource.getCharactersImage())
          .thenAnswer((_) async => [
                const GetCharactersImageResponseModel(
                    id: 1, fullName: 'fullName', imageUrl: 'imageUrl')
              ]);
    });
    test(
        'getHouses - should return List<GetHousesListResponseModel> when the response code is 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
              data: [
                {
                  "slug": "slug",
                  "name": "name",
                  "members": [
                    {
                      "name": "name",
                      "slug": "slug",
                      "image": "image",
                    }
                  ]
                }
              ],
              statusCode: 200,
              requestOptions: RequestOptions(
                path: 'https://api.gameofthronesquotes.xyz/v1/houses',
              )));

      // act
      final result = await gotHousesListRepositoryImpl.getHouses();

      // assert
      expect(result.length, 1);
    });
    test(
        'getCharactersImage - should return List<GetCharactersImageResponseModel> when the response code is 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
              data: [
                {
                  "id": 1,
                  "fullName": "fullName",
                  "imageUrl": "imageUrl",
                }
              ],
              statusCode: 200,
              requestOptions: RequestOptions(
                path: 'https://thronesapi.com/api/v2/Characters',
              )));

      // act
      final result = await gotHousesListRepositoryImpl.getCharactersImage();

      // assert
      expect(result.length, 1);
    });
  });

  group('When call is different 200', () {
    setUp(() {
      when(() => mockGOTHousesDatasource.getHouses())
          .thenAnswer((_) async => throw Exception('Erro ao obter casas'));

      when(() => mockGOTHousesDatasource.getCharactersImage())
          .thenAnswer((_) => throw Exception('Erro ao obter imagens'));
    });

    test(
        ' get houses - should throw an exception when the response code is not 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
          data: [],
          statusCode: 404,
          requestOptions: RequestOptions(
            path: 'https://api.gameofthronesquotes.xyz/v1/houses',
          )));

      // act
      final call = gotHousesListRepositoryImpl.getHouses;

      // assert
      expect(() => call(), throwsException);
    });

    test(
        'getCharactersImage - should throw an exception when the response code is not 200',
        () async {
      // arrange

      when(() => mockDio.get(any())).thenAnswer((_) async => Response(
          data: [],
          statusCode: 404,
          requestOptions: RequestOptions(
            path: 'https://thronesapi.com/api/v2/Characters',
          )));

      // act
      final call = gotHousesListRepositoryImpl.getCharactersImage;

      // assert
      expect(() => call(), throwsException);
    });
  });
}
