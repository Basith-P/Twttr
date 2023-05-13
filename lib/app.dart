import 'package:flutter/material.dart';

import 'utils/global_keys.dart';
import 'utils/routes.dart';
import 'utils/theme/theme.dart';

class Twttr extends StatelessWidget {
  const Twttr({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Twttr',
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.appRoutes,
      ),
    );
  }
}
