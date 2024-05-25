import 'dart:convert';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';

class GetCharactersImageResponseModel extends GetCharactersImageEntity {
  const GetCharactersImageResponseModel({
    required super.id,
    super.firstName,
    super.lastName,
    super.fullName,
    super.title,
    super.family,
    super.image,
    super.imageUrl,
  });

  factory GetCharactersImageResponseModel.fromMap(Map<String, dynamic> map) {
    return GetCharactersImageResponseModel(
      id: map['id'] ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      fullName: map['fullName'] ?? '',
      title: map['title'] ?? '',
      family: map['family'] ?? '',
      image: map['image'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  factory GetCharactersImageResponseModel.fromJson(String source) =>
      GetCharactersImageResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
