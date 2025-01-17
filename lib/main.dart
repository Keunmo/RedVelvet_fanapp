import 'package:flutter/material.dart';
import 'package:redvelvet/screens/home_screen.dart';
import 'theme.dart' as Theme;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedVelvet Homepage',
      color: Theme.RVColors.coral[50],
      theme: Theme.RVThemeData,
      home: HomeScreen(),
    );
  }
}
