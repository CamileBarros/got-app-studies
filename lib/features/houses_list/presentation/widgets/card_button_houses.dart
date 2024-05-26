import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum EducationalBannerSize {
  small,
  medium,
}

class CardButtonHouses extends StatelessWidget {
  const CardButtonHouses({
    required this.text,
    required this.onTap,
    required this.imageUrl,
    this.colorSecondary = Colors.black,
    this.colorPrimary = Colors.white,
    super.key,
  });
  final String text;
  final VoidCallback onTap;
  final Color? colorSecondary;
  final Color? colorPrimary;
  final String imageUrl;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    colorSecondary ?? Colors.black,
                  ]),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: SvgPicture.asset(
                    alignment: Alignment.topLeft,
                    'assets/images/$imageUrl',
                  ),
                ),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Cinzel',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
