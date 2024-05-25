import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_app/features/houses/data/data_source/houses_data_source.dart';
import 'package:got_app/features/houses/data/repositories/houses_repository_impl.dart';
import 'package:got_app/features/houses/domain/use_cases/houses_use_case.dart';
import 'package:got_app/features/houses/presentation/state/cubit/houses_cubit.dart';
import 'package:got_app/features/houses/presentation/state/cubit/houses_state.dart';

class HousesPage extends StatelessWidget {
  const HousesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final housesRepository = HousesRepositoryImpl(
        housesDataSource: HousesDatasourceImpl(dioClient: Dio()),
        dioClient: Dio()); // Implemente o repositório
    final housesUseCase = HouseUseCaseImpl(housesRepository: housesRepository);
    final housesCubit = HousesCubit(housesUseCase: housesUseCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Houses'),
      ),
      body: BlocProvider(
        create: (_) => housesCubit..fetchHouses(),
        child: BlocBuilder<HousesCubit, HousesState>(
          builder: (context, state) {
            if (state is HousesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HousesLoaded) {
              return ListView.builder(
                itemCount: state.houses.length,
                itemBuilder: (context, index) {
                  final house = state.houses[index];
                  return ListTile(
                    title: Text(house.name),
                    // Adicione outras propriedades de exibição conforme necessário
                  );
                },
              );
            } else if (state is HousesError) {
              return Center(child: Text('Erro: ${state.message}'));
            } else {
              return const Center(child: Text('Nenhum dado disponível'));
            }
          },
        ),
      ),
    );
  }
}
