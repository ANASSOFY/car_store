import 'package:flutter/material.dart';
import 'screens/auth/landing_screen.dart';

void main() {
  runApp(CarStoreAuthApp());
}

class CarStoreAuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}
