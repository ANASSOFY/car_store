import 'package:car_store/widgets/cards/brand_card.dart';
import 'package:car_store/widgets/cards/suggestion_card.dart';
import 'package:car_store/widgets/custom_button_navigation_bar.dart';
import 'package:car_store/widgets/row_text_and_button.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_search_bar.dart';

class SelectCarBrandScreen extends StatelessWidget {
  const SelectCarBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> brandImages = [
      "assets/images/hyundai.png",
      "assets/images/tata.png",
      "assets/images/honda.png",
      "assets/images/bmw.png",
      "assets/images/audi.png",
      "assets/images/toyota.png",
    ];
    List<String> suggestionImages = [
      "assets/images/redcar.jpg",
      "assets/images/testcar.jpg",
      "assets/images/driving.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
            size: 30,
          ),
          SizedBox(width: 20),
          Icon(Icons.info_outline_rounded, color: Colors.black, size: 30),
          SizedBox(width: 20),
          Icon(Icons.person, color: Colors.black, size: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 20),

            CustomSearchBar(),
            SizedBox(height: 30),
            RowTextAndButton(
              text: "Select your car brand",
              buttonTitle: "Switch to Sell",
            ),

            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: brandImages.length,
                itemBuilder: (context, index) {
                  return BrandCard(image: brandImages[index]);
                },
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Buy in 3 easy steps",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: suggestionImages.length,
                itemBuilder: (context, index) {
                  return SuggestionCard(image: suggestionImages[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonNavigationBar(),
    );
  }
}
