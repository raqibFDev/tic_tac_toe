import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/gamePage.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GamePage();
  }
}
