import 'package:flutter/material.dart';
import 'verify_otp_screen.dart';
import 'create_account_screen.dart';
import '../../widgets/button_app.dart';
import '../../widgets/text_field_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/custom_text_rich.dart';
import '../../widgets/custom_text_with_click.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
          const GradientContainer(),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextRich(text1: "Welcome ", text2: "back"),
                const SizedBox(height: 60),

                const TextFieldApp(
                  title: "Enter your Mobile no",
                  hintText: "Enter phone no",
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  inputFormatters: [],
                ),
                const SizedBox(height: 20),

                ButtonApp(
                  title: "Get OTP",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VerifyOtpScreen()),
                    );
                  },
                ),
                const SizedBox(height: 20),

                CustomTextWithClick(
                  text1: "Create a new ",
                  text2: "account",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateAccountScreen()),
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
