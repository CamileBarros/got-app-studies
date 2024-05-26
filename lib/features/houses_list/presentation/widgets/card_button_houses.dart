import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

enum EducationalBannerSize {
  small,
  medium,
}

class CardButtonHouses extends StatelessWidget {
  const CardButtonHouses({
    required this.description,
    required this.onTap,
    required this.imageUrl,
    this.title = '',
    this.colorBanner1 = Colors.black,
    this.colorBanner2 = Colors.black,
    this.colorText = Colors.white,
    this.borderColor = Colors.black,
    super.key,
  });
  final String description;
  final String title;
  final VoidCallback onTap;
  final Color? colorBanner1;
  final Color? colorBanner2;
  final Color? colorText;
  final Color? borderColor;
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
                    colorBanner1 ?? Colors.black,
                    colorBanner2 ?? Colors.black,
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
                        description,
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
