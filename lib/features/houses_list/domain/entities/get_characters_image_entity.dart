import 'package:equatable/equatable.dart';

class GetCharactersImageEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String title;
  final String family;
  final String image;
  final String imageUrl;

  const GetCharactersImageEntity({
    required this.id,
    this.firstName = '',
    this.lastName = '',
    this.fullName = '',
    this.title = '',
    this.family = '',
    this.image = '',
    this.imageUrl = '',
  });
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        fullName,
        title,
        family,
        image,
        imageUrl,
      ];
}
