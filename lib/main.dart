import 'package:flutter/material.dart';
import 'features/home/view/home_screen.dart';

void main() {
  runApp(BatikApp());
}

class BatikApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batik App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF8F4F0),
      ),
      home: HomeScreen(),
    );
  }
}
