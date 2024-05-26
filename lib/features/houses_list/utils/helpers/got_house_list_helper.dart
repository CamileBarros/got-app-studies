// ignore: depend_on_referenced_packages, implementation_imports
import 'package:collection/src/iterable_extensions.dart';
import 'package:got_app/features/houses_list/utils/enum/houses_enum.dart';

mixin GOTHousesListHelper {
  String getPathByHouseName(String name) {
    final house = HousesEnum.values.firstWhereOrNull(
      (enumValue) => name.toLowerCase().contains(enumValue.value.toLowerCase()),
    );
    print(house?.path ?? '');
    return house?.path ?? '';
    
  }
}
