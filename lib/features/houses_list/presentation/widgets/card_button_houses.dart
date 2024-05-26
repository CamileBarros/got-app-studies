import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? Colors.white,
            ),
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
              if (title.isNotEmpty) ...[
                Text(
                  title,
                ),
                const SizedBox(height: 8),
              ],
              SvgPicture.asset(
                width: 42,
                height: 42,
                'assets/images/$imageUrl',
              ),
              const SizedBox(height: 42),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Cinzel',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // DecoratedBox(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: Colors.white,
                  //     ),
                  //     borderRadius: BorderRadius.circular(100),
                  //   ),
                  //   child: const Padding(
                  //       padding: EdgeInsets.all(12),
                  //       child: Icon(Icons.chevron_right_outlined)),
                  // ),
                ],
              ),
            ],
          ),
        ),
      );
}
