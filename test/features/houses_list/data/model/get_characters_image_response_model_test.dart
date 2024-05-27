import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:got_app/features/houses_list/data/model/get_characters_image_response_model.dart';

void main() {
  group('GetCharactersImageResponseModel -', () {
    test('GetCharactersImageResponseModel.fromJson should return a valid model',
        () async {
      final result = GetCharactersImageResponseModel.fromMap(
        json.decode(
          File('test/fixture/get_characters_image.json').readAsStringSync(),
        ),
      );

      expect(result, isA<GetCharactersImageResponseModel>());
      expect(result.family, equals('House Targaryen'));
    });
  });

  group('GetCharactersImageResponseModel -', () {
    test('GetCharactersImageResponseModel.fromJson when null should return a valid model',
        () async {
      final result = GetCharactersImageResponseModel.fromMap(
        json.decode(
          File('test/fixture/get_characters_image_null.json').readAsStringSync(),
        ),
      );

      expect(result, isA<GetCharactersImageResponseModel>());
      expect(result.family, equals(''));
    });
  });
}
