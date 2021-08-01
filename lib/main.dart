import 'package:flutter/material.dart';
import 'package:netflixui/screens/detail_screen.dart';
import 'package:netflixui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI Redesign',
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}

