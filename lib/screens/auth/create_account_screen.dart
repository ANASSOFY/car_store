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
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
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
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 28),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/carr.jpg',
              fit: BoxFit.cover,
            ),
          ),
          GradientContainer(),

          /// Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Create an ',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'account',
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
                SizedBox(height: 20),

                /// Subtitle
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
                      MaterialPageRoute(builder: (_) => CreateAccountScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
