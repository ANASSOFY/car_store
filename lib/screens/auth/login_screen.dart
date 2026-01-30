import 'package:car_store/screens/auth/create_account_screen.dart';
import 'package:car_store/screens/auth/verify_otp_screen.dart' hide GradientContainer;
import 'package:car_store/widgets/cards/sign_up_with_card.dart';
import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:car_store/widgets/custom_text_rich.dart';
import 'package:car_store/widgets/custom_text_with_click.dart';
import 'package:flutter/material.dart';
import '../../widgets/button_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/text_field_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
          GradientContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                CustomTextRich(text1: "Welcome ", text2: "back"),
                SizedBox(height: 80),
                TextFieldApp(
                  title: "Enter your Mobile no",
                  hintText: "Enter  phone no",
                ),
                SizedBox(height: 20),
                ButtonApp(
                  title: "Get otp",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => VerifyOtpScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                CustomTextWithClick(text1: "Create a new ", text2: "account",onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateAccountScreen(),
                  ),
                ),),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                SizedBox(height: 50),

                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign up with",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      SizedBox(width: 30),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/Logo-google.png"),
                      ),
                      SizedBox(width: 15),
                      VerticalDivider(),
                      SizedBox(width: 15),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/apple-logo.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
