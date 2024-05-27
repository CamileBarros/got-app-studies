import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:got_app/features/houses_list/data/data_source/got_houses_list_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late GOTHousesDatasourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = GOTHousesDatasourceImpl(dioClient: mockDio);
  });

  group('getHouses', () {
    test(
        'should return List<GetHousesListResponseModel> when the response code is 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(data: [
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
          ], statusCode: 200, requestOptions: RequestOptions()));

      // act
      final result = await dataSource.getHouses();

      // assert
      expect(result.length, 1);
    });

    test('should throw an exception when the response code is not 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async =>
          Response(data: [], statusCode: 404, requestOptions: RequestOptions()));

      // act
      final call = dataSource.getHouses;

      // assert
      expect(() => call(), throwsException);
    });
  });

  group('getCharactersImage', () {
    test(
        'should return List<GetCharactersImageResponseModel> when the response code is 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(data: [
            {
              "id": 1,
              "fullName": "fullName",
              "imageUrl": "imageUrl",
            }
          ], statusCode: 200, requestOptions: RequestOptions()));

      // act
      final result = await dataSource.getCharactersImage();

      // assert
      expect(result.length, 1);
    });

    test('should throw an exception when the response code is not 200',
        () async {
      // arrange
      when(() => mockDio.get(any())).thenAnswer((_) async =>
          Response(data: [], statusCode: 404, requestOptions: RequestOptions()));

      // act
      final call = dataSource.getCharactersImage;

      // assert
      expect(() => call(), throwsException);
    });
  });
}
