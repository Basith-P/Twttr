import 'package:flutter/material.dart';
import 'package:twttr/common/common.dart';
import 'package:twttr/features/tweet/models/tweet_model.dart';
import 'package:twttr/features/tweet/pages/reply_tweet_view.dart';

import '../common/splash_page.dart';
import '../features/auth/views/pages/login_page.dart';
import '../features/auth/views/pages/singup_page.dart';
import '../features/feed/pages/home_page.dart';
import '../features/tweet/pages/create_tweet_page.dart';

class Routes {
  static Route<dynamic> appRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (_) => const SplashPage());
      case LoaderPage.routeName:
        return MaterialPageRoute<dynamic>(builder: (_) => const LoaderPage());
      case ErrorPage.routeName:
        return MaterialPageRoute<dynamic>(
            builder: (_) => ErrorPage(args as String));
      case SignupPage.routeName:
        return MaterialPageRoute<dynamic>(builder: (_) => const SignupPage());
      case LoginPage.routeName:
        return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
      case HomePage.routeName:
        return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
      case CreateTweetPage.routeName:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const CreateTweetPage());
      case TwitterReplyScreen.routeName:
        return MaterialPageRoute<dynamic>(
            builder: (_) => TwitterReplyScreen(tweet: args as Tweet));
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Scaffold(body: Center(child: Text('404'))));
    }
  }
}
