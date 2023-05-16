import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twttr/constants/constants.dart';
import 'package:twttr/features/tweet/pages/create_tweet_page.dart';
import 'package:twttr/utils/functions.dart';
import 'package:twttr/utils/theme/theme.dart';

import '../../tweet/widgets/tweets_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UIConstants.appBar,
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          TweetsList(),
          Center(child: Text('Explore Page')),
          Center(child: Text('Notifications Page')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigator.pushNamed(CreateTweetPage.routeName),
        child: SvgPicture.asset(AssetsConstants.newTweetIcon),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.greyDark, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.homeOutlinedIcon),
              activeIcon: SvgPicture.asset(AssetsConstants.homeFilledIcon),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.searchIcon),
              activeIcon: SvgPicture.asset(AssetsConstants.searchActiveIcon),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsConstants.notifOutlinedIcon),
              activeIcon: SvgPicture.asset(AssetsConstants.notifFilledIcon),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
