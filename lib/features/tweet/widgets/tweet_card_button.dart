import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twttr/utils/theme/theme.dart';

class TweetCardButton extends StatelessWidget {
  const TweetCardButton({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onPressed,
  });

  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: SvgPicture.asset(
        iconPath,
        color: AppColors.grey,
        height: 18,
      ),
      label: Text(text),
    );
  }
}
