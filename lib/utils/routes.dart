import 'package:flutter/material.dart';

import '../features/auth/views/pages/login_page.dart';
import '../features/auth/views/pages/singup_page.dart';

class Routes {
  static Route<dynamic> appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (_) => const SignupPage());
      case SignupPage.routeName:
        return MaterialPageRoute<dynamic>(builder: (_) => const SignupPage());
      case LoginPage.routeName:
        return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Scaffold(body: Center(child: Text('404'))));
    }
  }
}
