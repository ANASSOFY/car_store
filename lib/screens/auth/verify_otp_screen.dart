import 'package:car_store/screens/auth/login_screen.dart';
import 'package:car_store/widgets/button_app.dart';
import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:car_store/widgets/custom_text_with_click.dart';
import 'package:car_store/widgets/otp_num.dart';
import 'package:flutter/material.dart';
import '../../widgets/gradient_container.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
          GradientContainer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Otp",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "We have sent the code verification to your mobile no",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff807E7E),
                  ),
                ),
                SizedBox(height: 20,),
                OtpNum(),
                SizedBox(height: 60,),
                ButtonApp(title: "Verify", onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (builder)=>LoginScreen()));},),
                SizedBox(height: 60,),
                Text(
                  "00:34",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff807E7E),
                  ),
                ),
                SizedBox(height: 60),
                CustomTextWithClick(text1: "Don't receive code? ", text2: "request again"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
