import 'package:flutter/material.dart';

void main() {
  runApp(const Twttr());
}

class Twttr extends StatelessWidget {
  const Twttr({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Twttr', home: Scaffold());
  }
}
