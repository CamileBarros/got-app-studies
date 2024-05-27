import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:got_app/features/houses_list/data/model/get_houses_model_response.dart';
import 'package:got_app/features/houses_list/data/model/members_house_model.dart';

void main() {
  group('GetHousesListResponseModel -', () {
    test('GetHousesListResponseModel.fromJson should return a valid model',
        () async {
      final result = GetHousesListResponseModel.fromMap(
        json.decode(
          File('test/fixture/get_houses.json').readAsStringSync(),
        ),
      );

      expect(result, isA<GetHousesListResponseModel>());
      expect(
          result.members,
          equals([
            const MembersHouseModel(
                name: 'Daenerys Targaryen', slug: 'Queen of the Andals')
          ]));
    });
    test(
        'GetHousesListResponseModel.fromJson when null should return a valid model',
        () async {
      final result = GetHousesListResponseModel.fromMap(
        json.decode(
          File('test/fixture/get_houses_null.json').readAsStringSync(),
        ),
      );

      expect(result, isA<GetHousesListResponseModel>());
      expect(result.members, equals([]));
    });
  });
}
