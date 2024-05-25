import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_cubit.dart';
import 'package:got_app/features/houses_list/presentation/state/cubit/got_houses_state.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:got_app/features/houses_list/presentation/widgets/page_view_houses_card.dart';
import 'package:got_app/features/houses_list/utils/enum/got_houses_list_page_status_enum.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({required this.gotHousesStateBackup, super.key});
  final GOTHousesStateBackup gotHousesStateBackup;

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    await widget.gotHousesStateBackup.getHouses();
    await widget.gotHousesStateBackup.getCharactersImage();
    });
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: const GOTAppBar(title: 'Game of Thrones Houses',),
        body: ValueListenableBuilder(
            valueListenable: widget.gotHousesStateBackup.statusPage,
            builder: (_, GOTHousesListPageStateEnum status, __) {
              if (status == GOTHousesListPageStateEnum.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (status == GOTHousesListPageStateEnum.loaded) {
                return PageViewHousesCard(
                    gotHousesStateBackup: widget.gotHousesStateBackup);
              } else if (status == GOTHousesListPageStateEnum.error) {
                return Center(
                  child: Text(widget.gotHousesStateBackup.errorMessage.value),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      );
}
