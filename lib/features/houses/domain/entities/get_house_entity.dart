
import 'package:equatable/equatable.dart';

class GetHouseEntity extends Equatable {
  final String url;
  final String name;
  final String region;
  final String coatOfArms;
  final String words;
  final List<String> titles;
  final List<String> seats;
  final String currentLord;
  final String heir;
  final String overlord;
  final String founded;
  final String founder;
  final String diedOut;
  final List<String> ancestralWeapons;
  final List<String> cadetBranches;
  final List<String> swornMembers;

  const GetHouseEntity({
    required this.url,
    required this.name,
    required this.region,
    required this.coatOfArms,
    required this.overlord,
    this.words = '',
    this.titles = const [],
    this.seats = const [],
    this.currentLord = '',
    this.heir = '',
    this.founded = '',
    this.founder = '',
    this.diedOut = '',
    this.ancestralWeapons = const [],
    this.cadetBranches = const [],
    this.swornMembers = const [],
  });

  @override
  List<Object?> get props => [
        url,
        name,
        region,
        coatOfArms,
        words,
        titles,
        seats,
        currentLord,
        heir,
        overlord,
        founded,
        founder,
        diedOut,
        ancestralWeapons,
        cadetBranches,
        swornMembers,
      ];
}
