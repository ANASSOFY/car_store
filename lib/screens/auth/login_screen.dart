<<<<<<< HEAD
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
=======
import 'package:car_store/screens/auth/create_account_screen.dart';
import 'package:car_store/screens/auth/verify_otp_screen.dart';
import 'package:car_store/widgets/cards/sign_up_with_card.dart';
import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:car_store/widgets/custom_text_rich.dart';
import 'package:car_store/widgets/custom_text_with_click.dart';
import 'package:flutter/material.dart';
import '../../widgets/button_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/text_field_app.dart';

class LoginScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

   LoginScreen({super.key});
>>>>>>> 9e39861 (profile screen)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
=======
      appBar: CustomAppBar(),
>>>>>>> 9e39861 (profile screen)
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
<<<<<<< HEAD
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
=======
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
                  hintText: "Enter  phone no", controller: phoneController,
                ),
                SizedBox(height: 20),
                ButtonApp(
                  title: "Get otp",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => VerifyOtpScreen(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text, role: "user",
                      ),
                    ) );
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SignUpWithCard(),
>>>>>>> 9e39861 (profile screen)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
