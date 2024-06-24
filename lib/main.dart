import 'package:animations_group_5_mohandseen/explicit_screen.dart';
import 'package:animations_group_5_mohandseen/implicit_screen.dart';
import 'package:animations_group_5_mohandseen/screen1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExplicitScreen(),
    );
  }
}
