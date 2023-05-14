import 'package:flutter/material.dart';

final scaffoleMessengerKey = GlobalKey<ScaffoldMessengerState>();
final navKey = GlobalKey<NavigatorState>();

void showSnackBar(String message) {
  final snackBar = SnackBar(content: Text(message));
  scaffoleMessengerKey.currentState!.showSnackBar(snackBar);
}

NavigatorState get navigator => navKey.currentState!;
void pop() => navigator.pop();
void popUntil(RoutePredicate predicate) => navigator.popUntil(predicate);
