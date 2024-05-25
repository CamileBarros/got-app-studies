import 'package:equatable/equatable.dart';
import 'package:got_app/features/houses_list/domain/entities/members_house_entity.dart';

class GetHousesListEntity extends Equatable {
  final String slug;
  final String name;
  final List<MembersHouseEntity> members;

  const GetHousesListEntity({
    required this.slug,
    required this.name,
    required this.members,
  });

  @override
  List<Object?> get props => [
        slug,
        name,
        members,
      ];
}
