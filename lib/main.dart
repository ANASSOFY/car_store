import 'package:flutter/material.dart';
import 'screens/auth/landing_screen.dart';

void main() {
  runApp(CarStoreAuthApp());
}

class CarStoreAuthApp extends StatelessWidget {
  const CarStoreAuthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}