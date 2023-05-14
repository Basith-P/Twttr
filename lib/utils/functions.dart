import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global_keys.dart';

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

Future<List<File>> pickImages() async {
  final result = await ImagePicker().pickMultiImage();
  return result.map((e) => File(e.path)).toList();
}
