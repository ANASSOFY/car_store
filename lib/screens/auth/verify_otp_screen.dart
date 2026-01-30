import 'package:car_store/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
    );
  }
}

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());

  bool isOtpComplete = false;

  void _checkOtp() {
    setState(() {
      isOtpComplete =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 30,
                  children:List.generate(4, (index)=>SizedBox(
                    height: 60,
                    width: 66,
                    child: TextField(
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),

                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),)
                ),
                SizedBox(height: 60,),
                ButtonApp(title: "Verify", onPressed: (){},),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't receive code? ",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "request again",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
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
