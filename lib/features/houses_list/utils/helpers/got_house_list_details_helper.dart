// ignore: depend_on_referenced_packages, implementation_imports
import 'package:collection/src/iterable_extensions.dart';
import 'package:got_app/features/houses_list/domain/entities/get_characters_image_entity.dart';

mixin GOTHouseListDetailsHelper {
  String getImageUrl(
      String slug, List<GetCharactersImageEntity> imageCharacters) {
    return imageCharacters
            .firstWhereOrNull((element) =>
                element.firstName.toLowerCase() == slug.toLowerCase())
            ?.imageUrl ??
        '';
  }

  String getMemberTitle(
      String slug, List<GetCharactersImageEntity> imageCharacters) {
    return imageCharacters
            .firstWhereOrNull((element) =>
                element.firstName.toLowerCase() == slug.toLowerCase())
            ?.title ??
        slug;
  }
}
