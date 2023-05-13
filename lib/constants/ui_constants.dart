import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twttr/utils/theme/app_colors.dart';

import 'assets_constants.dart';

class UIConstants {
  static AppBar appBar = AppBar(
    title: SvgPicture.asset(
      AssetsConstants.twitterLogo,
      height: 30,
      color: AppColors.blue,
    ),
    centerTitle: true,
  );

  // static const List<Widget> bottomTabBarPages = [
  //   TweetList(),
  //   ExploreView(),
  //   NotificationView(),
  // ];

  // static const kinputDecoration
}

const kDefaultPadding = EdgeInsets.all(16.0);
const kDefaultButtonPadding =
    EdgeInsets.symmetric(horizontal: 18, vertical: 14);
const kDefaultBorderRadiusSmall = BorderRadius.all(Radius.circular(6.0));

const kInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: kDefaultBorderRadiusSmall,
    borderSide: BorderSide(color: AppColors.grey),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: kDefaultBorderRadiusSmall,
    borderSide: BorderSide(color: AppColors.grey),
  ),
);

const gapH1 = SizedBox(height: 4);
const gapH2 = SizedBox(height: 8);
const gapH3 = SizedBox(height: 12);
const gapH4 = SizedBox(height: 16);
const gapH5 = SizedBox(height: 20);
const gapH6 = SizedBox(height: 24);
const gapH7 = SizedBox(height: 32);
const gapH8 = SizedBox(height: 40);
const gapH9 = SizedBox(height: 48);
const gapH10 = SizedBox(height: 56);
