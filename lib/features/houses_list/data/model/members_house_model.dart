import 'dart:convert';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';

class MembersHouseModel extends MembersHouseEntity {

  const MembersHouseModel({
    required super.name,
    required super.slug,
  });

  factory MembersHouseModel.fromMap(Map<String, dynamic> map) {
    return MembersHouseModel(
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  factory MembersHouseModel.fromJson(String source) => MembersHouseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
