import 'package:flutter/material.dart';

enum EducationalBannerSize {
  small,
  medium,
}

class CardButtonHouses extends StatelessWidget {
  const CardButtonHouses({
    required this.description,
    required this.onTap,
    this.title = '',
    this.colorBanner1 = Colors.black,
    this.colorBanner2 = Colors.black,
    this.colorText = Colors.white,
    this.hasImageBackground = false,
    this.size = EducationalBannerSize.medium,
    this.hasIcon = true,
    this.borderColor = Colors.black,
    super.key,
  });
  final String description;
  final String title;
  final VoidCallback onTap;
  final Color? colorBanner1;
  final Color? colorBanner2;
  final Color? colorText;
  final bool hasImageBackground;
  final EducationalBannerSize size;
  final bool hasIcon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(
            _getBannersSize(size),
          ),
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
                  if (hasIcon)
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.chevron_right_outlined)),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
  double _getBannersSize(EducationalBannerSize size) {
    switch (size) {
      case EducationalBannerSize.small:
        return 12.0;
      case EducationalBannerSize.medium:
        return 24.0;
    }
  }
}
