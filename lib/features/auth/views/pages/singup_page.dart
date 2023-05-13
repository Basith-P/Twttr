import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:twttr/features/auth/views/pages/login_page.dart';
import 'package:twttr/utils/global_keys.dart';

import '../../../../common/common.dart';
import '../../../../constants/ui_constants.dart';

class SignupPage extends HookWidget {
  const SignupPage({Key? key}) : super(key: key);

  static const routeName = '/signup';

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
                      Text('Create your account',
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
                  child: PrimaryBUtton(text: 'Sign up', onPressed: () {})),
              gapH10,
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  children: [
                    TextSpan(
                      text: 'Log in',
                      style: theme.textTheme.bodyLarge
                          ?.copyWith(color: theme.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => navKey.currentState
                            ?.pushReplacementNamed(LoginPage.routeName),
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
