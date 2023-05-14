import 'package:flutter/material.dart';
import 'package:twttr/utils/theme/app_colors.dart';

import '../constants/ui_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.padding = kDefaultButtonPadding,
    this.backgroundColor = AppColors.white,
    this.foregroundColor = AppColors.black,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: padding,
        minimumSize: const Size(80, 20),
      ),
      child: Text(text),
    );
  }
}
