import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      icon: SvgPicture.asset(iconPath),
      label: Text(text),
    );
  }
}
