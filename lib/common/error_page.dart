import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.message, {Key? key}) : super(key: key);

  final String message;

  static const routeName = '/error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ErrorWidget(message));
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget(this.message, {Key? key}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}
