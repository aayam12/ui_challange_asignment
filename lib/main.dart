import 'package:flutter/material.dart';
import 'package:ui_challenge/tab_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'UI Challenge',
      home: SafeArea(child: MyTabBar()),
    );
  }
}
