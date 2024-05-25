import 'dart:convert';
import 'package:got_app/features/houses_list/data/model/members_house_model.dart';
import 'package:got_app/features/houses_list/domain/entities/get_houses_list_entity.dart';

class GetHousesListResponseModel extends GetHousesListEntity {
  const GetHousesListResponseModel({
    required super.slug,
    required super.name,
    required super.members,
  });

  factory GetHousesListResponseModel.fromMap(Map<String, dynamic> map) {
    return GetHousesListResponseModel(
      slug: map['slug'] ?? '',
      name: map['name'] ?? '',
      members: List<MembersHouseModel>.from(
        (map['members'] ?? List<MembersHouseModel> ).map<MembersHouseModel>(
          (x) => MembersHouseModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory GetHousesListResponseModel.fromJson(String source) =>
      GetHousesListResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
