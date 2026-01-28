import 'package:car_store/screens/auth/create_account_screen.dart';
import 'package:car_store/screens/auth/request_otp_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/button_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/text_field_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          /// Background Image
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
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
                    text: 'Welcome ',
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'back',
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
                      MaterialPageRoute(builder: (_) => RequestOtpScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a new ",
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
                        MaterialPageRoute(
                          builder: (context) => CreateAccountScreen(),
                        ),
                      ),
                      child: Text(
                        "account",
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
