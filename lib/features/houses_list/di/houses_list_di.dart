import 'dart:async';

import 'package:dio/dio.dart';
import 'package:got_app/features/core/injection/injection.dart';
import 'package:got_app/features/core/injection/injection_feature.dart';
import 'package:got_app/features/houses_list/data/data_source/got_houses_data_source.dart';
import 'package:got_app/features/houses_list/data/repositories/got_houses_repository_impl.dart';
import 'package:got_app/features/houses_list/domain/repositories/got_houses_repository.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';

class HousesListFeature implements InjectionFeature {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
  }) {
    injector
      ..registerFactory<Dio>(() => Dio())
      ..registerFactory<GOTHousesDatasource>(
        () => GOTHousesDatasourceImpl(dioClient: injector.get<Dio>()),
      )
      ..registerFactory<GOTHousesRepository>(
        () => HousesRepositoryImpl(
          gotHousesDataSource: injector.get<GOTHousesDatasource>(),
          dioClient: injector.get<Dio>(),
        ),
      )
      ..registerFactory<GetCharactersImageUseCase>(
        () => GetCharactersImageUseCaseImpl(
          gotHousesRepository: injector.get<GOTHousesRepository>(),
        ),
      )
      ..registerFactory<GetHousesUseCase>(
        () => GetHousesUseCaseImpl(
          gotHousesRepository: injector.get<GOTHousesRepository>(),
        ),
      );
  }
}
