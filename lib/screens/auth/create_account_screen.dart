import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../../widgets/button_app.dart';
import '../../widgets/text_field_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/custom_text_rich.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Hello!",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
          const GradientContainer(),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextRich(text1: "Create an ", text2: "account"),
                const SizedBox(height: 20),

                const TextFieldApp(
                  title: "Email Address",
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  inputFormatters: [],
                ),
                const SizedBox(height: 20),

                const TextFieldApp(
                  title: "Mobile Number",
                  hintText: "Enter your mobile no",
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  inputFormatters: [],
                ),
                const SizedBox(height: 20),

                const TextFieldApp(
                  title: "Password",
                  hintText: "Enter your password",
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  inputFormatters: [],
                ),
                const SizedBox(height: 32),

                ButtonApp(
                  title: "Create an account",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                ),
                const SizedBox(height: 24),

                // Login Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account ",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
