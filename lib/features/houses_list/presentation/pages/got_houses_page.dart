import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_cubit.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_state.dart';
import 'package:got_app/features/houses_list/presentation/widgets/page_view_houses_card.dart';

class HousesPage extends StatelessWidget {
  const HousesPage({super.key});


  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Game of Thrones Houses',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: BlocBuilder<GOTHousesCubit, GOTHousesStateData>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state.stateEnum == GOTHousesStateEnum.loading) {
              state.houses;
              state.charactersImage;
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.stateEnum == GOTHousesStateEnum.loaded) {
              return PageViewHousesCard();
            } else if (state.stateEnum == GOTHousesStateEnum.error) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
}
