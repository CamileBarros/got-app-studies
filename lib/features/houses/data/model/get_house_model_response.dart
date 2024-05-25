import 'dart:convert';

import 'package:got_app/features/houses/domain/entities/get_house_entity.dart';

class GetHouseModelResponseModel extends GetHouseEntity {
  const GetHouseModelResponseModel({
    required super.url,
    required super.name,
    required super.region,
    required super.coatOfArms,
    required super.overlord,
    super.words,
    super.titles,
    super.seats,
    super.currentLord,
    super.heir,
    super.founded,
    super.founder,
    super.diedOut,
    super.ancestralWeapons,
    super.cadetBranches,
    super.swornMembers,
  });

  factory GetHouseModelResponseModel.fromMap(Map<String, dynamic> map) {
    return GetHouseModelResponseModel(
        url: map['url'] ?? '',
        name: map['name'] ?? '',
        region: map['region'] ?? '',
        coatOfArms: map['coatOfArms'] ?? '',
        words: map['words'] ?? '',
        titles: List<String>.from((map['titles'] ?? [])),
        overlord: map['overlord'] ?? '',
        seats: List<String>.from((map['seats'] ?? [])),
        currentLord: map['currentLord'] ?? '',
        heir: map['heir'] ?? '',
        founded: map['founded'] ?? '',
        founder: map['founder'] ?? '',
        diedOut: map['diedOut'] ?? '',
        ancestralWeapons: List<String>.from((map['ancestralWeapons'] ?? [])),
        cadetBranches: List<String>.from((map['cadetBranches'] ?? [])),
        swornMembers: List<String>.from(
          (map['swornMembers'] ?? []),
        ));
  }

  factory GetHouseModelResponseModel.fromJson(String source) =>
      GetHouseModelResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
