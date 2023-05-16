import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:twttr/utils/theme/app_colors.dart';

import '../../../constants/ui_constants.dart';

class TweetImagesCarousel extends HookWidget {
  const TweetImagesCarousel(this.imageUrls, {Key? key}) : super(key: key);

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    final current = useState(0);

    return Column(
      children: [
        CarouselSlider(
          items: imageUrls
              .map(
                (imageUrl) => Container(
                  margin:
                      const EdgeInsets.only(right: kDefaultPaddingAmount / 2),
                  decoration: const BoxDecoration(
                    borderRadius: kDefaultBorderRadius,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            enableInfiniteScroll: false,
            padEnds: false,
            onPageChanged: (i, _) => current.value = i,
          ),
        ),
        gapH3,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageUrls.asMap().entries.map(
            (entry) {
              final index = entry.key;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: kDefaultPaddingAmount / 4),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: current.value == index
                      ? AppColors.white
                      : AppColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
