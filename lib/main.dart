import 'package:flutter/material.dart';
import 'package:flutter_toonflix/screens/home_screen_webtoon.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
