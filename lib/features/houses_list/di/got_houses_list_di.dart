import 'dart:async';

import 'package:dio/dio.dart';
import 'package:got_app/features/core/injection/injection.dart';
import 'package:got_app/features/core/injection/injection_feature.dart';
import 'package:got_app/features/houses_list/data/data_source/got_houses_list_data_source.dart';
import 'package:got_app/features/houses_list/data/repositories/got_houses_list_repository_impl.dart';
import 'package:got_app/features/houses_list/domain/repositories/got_houses_list_repository.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_characters_image_use_case.dart';
import 'package:got_app/features/houses_list/domain/use_cases/get_houses_list_use_case.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';

class GOTHousesListFeature implements InjectionFeature {
  @override
  FutureOr<void> registerDependencies({
    required Injector injector,
  }) {
    injector
      ..registerFactory<Dio>(() => Dio())
      ..registerFactory<GOTHousesListDatasource>(
        () => GOTHousesDatasourceImpl(dioClient: injector.get<Dio>()),
      )
      ..registerFactory<GOTHousesListRepository>(
        () => GOTHousesListRepositoryImpl(
          gotHousesDataSource: injector.get<GOTHousesListDatasource>(),
          dioClient: injector.get<Dio>(),
        ),
      )
      ..registerFactory<GetCharactersImageUseCase>(
        () => GetCharactersImageUseCaseImpl(
          gotHousesRepository: injector.get<GOTHousesListRepository>(),
        ),
      )
      ..registerFactory<GetHousesListUseCase>(
        () => GetHousesUseCaseImpl(
          gotHousesRepository: injector.get<GOTHousesListRepository>(),
        ),
      )
      ..registerFactory<GOTHousesStateBackup>(
        () => GOTHousesStateBackup(
          getHousesUseCase: injector.get<GetHousesListUseCase>(),
          getCharactersImageUseCase: injector.get<GetCharactersImageUseCase>(),
        ),
      );
  }
}
