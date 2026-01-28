import 'package:car_store/screens/auth/verify_otp_screen.dart';
import 'package:car_store/screens/buy/select_car_brand_screen.dart';
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
      home: SelectCarBrandScreen(),
    );
  }
}