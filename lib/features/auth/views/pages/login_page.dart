import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:twttr/common/common.dart';
import 'package:twttr/constants/constants.dart';
import 'package:twttr/utils/global.dart';

import 'singup_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
        appBar: UIConstants.appBar,
        body: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('To get started, enter your email and password.',
                          style: theme.textTheme.titleLarge),
                      gapH8,
                      TextField(
                          controller: emailController,
                          decoration:
                              kInputDecoration.copyWith(labelText: 'Email')),
                      gapH4,
                      TextField(
                          controller: passwordController,
                          decoration:
                              kInputDecoration.copyWith(labelText: 'Password')),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryBUtton(text: 'Log in', onPressed: () {})),
              gapH10,
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: theme.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => navigator
                            .pushReplacementNamed(SignupPage.routeName),
                    ),
                  ],
                ),
              ),
              gapH4,
            ],
          ),
        ));
  }
}
