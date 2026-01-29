import 'package:car_store/screens/auth/login_screen.dart';
import 'package:car_store/screens/buy/select_car_brand_screen.dart';
import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:car_store/widgets/custom_text_rich.dart';
import 'package:car_store/widgets/custom_text_with_click.dart';
import 'package:car_store/widgets/gradient_container.dart';
import 'package:flutter/material.dart';
import '../../widgets/button_app.dart';
import '../../widgets/text_field_app.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
            child: SingleChildScrollView(
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  CustomTextRich(text1: "Create an ", text2: "account"),
                  SizedBox(height: 20),
                  TextFieldApp(
                    title: "Email Address",
                    hintText: "Enter your email",
                  ),
                  SizedBox(height: 20),
                  TextFieldApp(
                    title: "Mobile Number",
                    hintText: "Enter your mobile no",
                  ),
                  SizedBox(height: 20),
                  TextFieldApp(
                    title: "Password",
                    hintText: "Enter your password",
                  ),
                  SizedBox(height: 20),
                  ButtonApp(
                    title: "Create an account",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectCarBrandScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextWithClick(
                    text1: "Already have an account ",
                    text2: "Login",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
