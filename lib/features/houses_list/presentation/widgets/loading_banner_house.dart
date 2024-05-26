import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingBannerHouse extends StatelessWidget {
  final String imageUrl;
  const LoadingBannerHouse({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) => Center(
        child: SvgPicture.asset(
          height: MediaQuery.sizeOf(context).height / 3.5,
          'assets/images/$imageUrl',
        ),
      );
}
