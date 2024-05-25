import 'package:equatable/equatable.dart';

class MembersHouseEntity extends Equatable {
  final String name;
  final String slug;

  const MembersHouseEntity({
    required this.name,
    required this.slug,
  });

  @override
  List<Object?> get props => [
        name,
        slug,
      ];
}
