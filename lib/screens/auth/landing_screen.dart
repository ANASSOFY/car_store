<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'create_account_screen.dart';
import '../../widgets/button_app.dart';
import '../../widgets/gradient_container.dart';
=======
import 'package:car_store/widgets/button_app.dart';
import 'package:car_store/widgets/custom_text_rich.dart';
import 'package:flutter/material.dart';
import 'create_account_screen.dart';
>>>>>>> 9e39861 (profile screen)

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          /// ---------------- Background Image ----------------
          SizedBox.expand(
            child: Image.asset(
              'assets/images/carr.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter, 
            ),
          ),

          /// ---------------- Gradient Overlay ----------------
          const GradientContainer(),

         
          SafeArea(
            child: Column(
              children: [
               
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Your Trusted Marketplace\nfor Second-Hand ',
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          children: const [
                            TextSpan(
                              text: 'Cars',
                              style: TextStyle(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

               
                const Spacer(flex: 3),

              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        "Discover the Best Deals on Pre-Owned Cars",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),

                      ButtonApp(
                        title: "Get Started",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CreateAccountScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
=======
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextRich(
                      text1: "Your Trusted Marketplace\nfor Second-Hand ",
                      text2: "Cars\"",
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * .65),
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
                    ButtonApp(
                      title: "Get Started",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
>>>>>>> 9e39861 (profile screen)
            ),
          ),
        ],
      ),
    );
  }
}
