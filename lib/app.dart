import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/global.dart';
import 'utils/routes.dart';
import 'utils/theme/theme.dart';

class Twttr extends ConsumerWidget {
  const Twttr({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Twttr',
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        navigatorKey: navKey,
        scaffoldMessengerKey: scaffoleMessengerKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.appRoutes,
      ),
    );
  }
}
