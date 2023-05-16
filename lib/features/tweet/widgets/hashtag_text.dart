import 'package:flutter/material.dart';
import 'package:twttr/utils/theme/app_colors.dart';

class HashTagText extends StatelessWidget {
  const HashTagText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textspans = [];
    final urlRegEx = RegExp(r'https?://[\w/:%#\$&\?\(\)~\.=\+\-]+');
    const blueTextStyle = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    text.split(' ').forEach((word) {
      if (word.startsWith('#')) {
        textspans.add(TextSpan(text: word, style: blueTextStyle));
      } else if (word.startsWith('@')) {
        textspans.add(TextSpan(text: word, style: blueTextStyle));
      } else if (urlRegEx.hasMatch(word)) {
        textspans.add(TextSpan(text: ' $word ', style: blueTextStyle));
      } else {
        textspans.add(TextSpan(
            text: '$word ',
            style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16)));
      }
    });

    return RichText(
      text: TextSpan(children: textspans),
    );
  }
}
