import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  final String title;
  final String hintText;
  const TextFieldApp({super.key, required this.title, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Montserrat",
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20),
      TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ),
      )
    ],);
  }
}
