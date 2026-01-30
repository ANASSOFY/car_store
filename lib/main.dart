import 'package:car_store/screens/auth/landing_screen.dart';
import 'package:flutter/material.dart';
import 'screens/buy/select_car_brand_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingScreen(),
    );
  }
}
