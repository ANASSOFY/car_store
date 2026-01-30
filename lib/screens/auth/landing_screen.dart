import 'package:car_store/widgets/button_app.dart';
import 'package:car_store/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'create_account_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/carr.jpg',
              fit: BoxFit.cover,
            ),
          ),
          /// Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text.rich(
                  TextSpan(
                    text: 'Your Trusted Marketplace\nfor Second-Hand ',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Cars\"',
                        style: TextStyle(
                          fontFamily: "Montserrat",

                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 550),
                /// Subtitle
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Discover the Best Deals\non Pre-Owned Cars",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                /// Button
                ButtonApp(
                  title: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateAccountScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
