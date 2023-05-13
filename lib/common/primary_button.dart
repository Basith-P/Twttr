import 'package:flutter/material.dart';
import 'package:twttr/utils/theme/app_colors.dart';

import '../constants/ui_constants.dart';

class PrimaryBUtton extends StatelessWidget {
  const PrimaryBUtton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        padding: kDefaultButtonPadding,
      ),
      child: Text(text),
    );
  }
}
