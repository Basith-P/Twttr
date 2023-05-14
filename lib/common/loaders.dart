import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets_constants.dart';
import '../utils/theme/theme.dart';

const primaryLoader = Center(child: CircularProgressIndicator(strokeWidth: 2));

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AssetsConstants.twitterLogo,
            height: 30,
            color: AppColors.blue,
          ),
          const SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(strokeWidth: 2))
        ],
      ),
    ));
  }
}
