import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:got_app/features/houses_list/presentation/widgets/page_view_houses_card.dart';
import 'package:got_app/features/houses_list/utils/enum/got_houses_list_page_status_enum.dart';

class HousesPage extends StatelessWidget {
  const HousesPage({required this.gotHousesListState, super.key});
  final GOTHousesListState gotHousesListState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GOTAppBar(
        title: 'Game of Thrones Houses',
        onTapRefresh: () async {
          await gotHousesListState.loadData();
        },
      ),
      body: ValueListenableBuilder(
          valueListenable: gotHousesListState.statusPage,
          builder: (_, status, __) {
            if (status == GOTHousesListPageStateEnum.initial) {
              gotHousesListState.loadData();
            } else if (status == GOTHousesListPageStateEnum.loading) {
              return const Center(
                child: Image(
                  image: AssetImage('assets/images/icon_loading.gif'),
                  fit: BoxFit.cover,
                ),
              );
            } else if (status == GOTHousesListPageStateEnum.error) {
              return Center(
                child: Text(gotHousesListState.errorMessage.value),
              );
            }
            return PageViewHousesCard(
                gotHousesListState: gotHousesListState);
          }),
    );
  }
}
