import 'package:flutter/material.dart';

import 'global.dart';

void showSnackBar(String message) {
  final snackBar = SnackBar(content: Text(message));
  scaffoleMessengerKey.currentState!.showSnackBar(snackBar);
}

NavigatorState get navigator => navKey.currentState!;
void pop() => navigator.pop();
void popUntil(RoutePredicate predicate) => navigator.popUntil(predicate);

String getNameFromEmail(String email) {
  return email.split('@').first;
}
