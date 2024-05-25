import 'package:flutter/material.dart';

class GOTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GOTAppBar({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
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
      );

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
