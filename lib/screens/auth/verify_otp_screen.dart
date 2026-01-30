<<<<<<< HEAD
import 'package:car_store/screens/buy/select_car_brand_screen.dart';
import 'package:car_store/widgets/cards/car_card.dart' hide CarCard;
import 'package:flutter/material.dart';
import '../../widgets/button_app.dart';
import '../../widgets/gradient_container.dart';



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
=======
import 'package:car_store/screens/auth/login_screen.dart';
import 'package:car_store/widgets/button_app.dart';
import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:car_store/widgets/custom_text_with_click.dart';
import 'package:car_store/widgets/otp_num.dart';
import 'package:flutter/material.dart';
import '../../widgets/gradient_container.dart';
import '../profile/profile_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String role;

  const VerifyOtpScreen({super.key, required this.name, required this.email, required this.phone, required this.role, });
>>>>>>> 9e39861 (profile screen)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
            icon: const Icon(Icons.arrow_back_ios_new,
                color: Colors.white, size: 28),
          ),
        ],
      ),
=======
      appBar:CustomAppBar(),
>>>>>>> 9e39861 (profile screen)
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),
<<<<<<< HEAD
          const GradientContainer(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "OTP Verification",
=======
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
>>>>>>> 9e39861 (profile screen)
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
<<<<<<< HEAD
                const SizedBox(height: 10),
                const Text(
                  "We have sent the verification code to your mobile number",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: TextField(
                          controller: _controllers[index],
                          maxLength: 1,
                          onChanged: (_) => _checkOtp(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ButtonApp(
                  title: "Verify & Continue",
                  onPressed: isOtpComplete
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SelectCarBrandScreen()),
                          );
                        }
                      : null,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Didn't receive code? Request again",
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold),
                ),
=======
                SizedBox(height: 10),
                Text(
                  "We have sent the code verification to $phone",
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
                ButtonApp(
                  title: "Verify",
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(
                          name: name,
                          email: email,
                          phone: phone,
                          role: role,
                        ),
                      ),
                    );
                  },
                ),

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
>>>>>>> 9e39861 (profile screen)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
