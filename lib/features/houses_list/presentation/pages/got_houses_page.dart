import 'package:flutter/material.dart';
import 'package:got_app/features/houses_list/presentation/state/got_houses_state_backup.dart';
import 'package:got_app/features/houses_list/presentation/widgets/got_app_bar.dart';
import 'package:got_app/features/houses_list/presentation/widgets/page_view_houses_card.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({required this.gotHousesStateBackup, super.key});
  final GOTHousesStateBackup gotHousesStateBackup;

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  late Future<void> _loadDataFuture;

  @override
  void initState() {
    _loadDataFuture = widget.gotHousesStateBackup.loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GOTAppBar(
        title: 'Game of Thrones Houses',
      ),
      body: FutureBuilder<void>(
          future: _loadDataFuture,
          builder: (context, snapshot) {
            return PageViewHousesCard(
                gotHousesStateBackup: widget.gotHousesStateBackup);
          }),
    );
  }
}
