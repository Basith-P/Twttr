import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twttr/common/common.dart';
import 'package:twttr/utils/global.dart';

import '../features/auth/controller/auth_controller.dart';
import '../features/auth/views/pages/login_page.dart';
import '../features/home/home_page.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(currentAccountProvider).when(
            data: (user) {
              if (user != null) {
                navigator.pushReplacementNamed(HomePage.routeName);
              } else {
                navigator.pushReplacementNamed(LoginPage.routeName);
              }
            },
            error: (Object error, StackTrace stackTrace) {
              showSnackBar('Something went wrong');
              navigator.pushReplacementNamed(LoginPage.routeName);
            },
            loading: () {},
          );
    });

    return const LoaderPage();
  }
}
