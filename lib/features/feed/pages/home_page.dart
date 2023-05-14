import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twttr/constants/constants.dart';
import 'package:twttr/utils/theme/theme.dart';

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
          Center(child: Text('Home Page')),
          Center(child: Text('Explore Page')),
          Center(child: Text('Notifications Page')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
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
