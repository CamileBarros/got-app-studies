import 'package:flutter/material.dart';

class GOTAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GOTAppBar({
    super.key,
    required this.title,
    this.onTapRefresh,
  });
  final String title;
  final VoidCallback? onTapRefresh;
  @override
  Widget build(BuildContext context) => AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
        leading: Navigator.of(context).canPop()
            ? Padding(
                padding: const EdgeInsets.only(left: 12),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                ),
              )
            : null,
        actions: [
          if (onTapRefresh != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                  icon: const Icon(
                    Icons.refresh_outlined,
                  ),
                  onPressed: onTapRefresh),
            ),
        ],
      );

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
