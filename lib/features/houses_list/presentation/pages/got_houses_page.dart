import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_list_state.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:got_app/features/houses_list/presentation/widgets/page_view_houses_card.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({required this.gotHousesListState, super.key});
  final GOTHousesListState gotHousesListState;

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  late Future<void> _loadDataFuture;

  @override
  void initState() {
    _loadDataFuture = widget.gotHousesListState.loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: GOTAppBar(
        title: 'Game of Thrones Houses',
        onTapRefresh: () async {
          await widget.gotHousesListState.loadData();
        },
      ),
      body: FutureBuilder<void>(
          future: _loadDataFuture,
          builder: (context, snapshot) {
            return PageViewHousesCard(
                gotHousesStateBackup: widget.gotHousesListState);
          }),
    );
  }
}
