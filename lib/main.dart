import 'package:flutter/material.dart';
import 'package:flutter_cashbook/Screens/login.dart';
import 'package:flutter_cashbook/Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set this to false
      home: LoginPage(),
    );
  }
}
