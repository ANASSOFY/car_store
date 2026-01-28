import 'package:car_store/widgets/cards/brand_card.dart';
import 'package:car_store/widgets/cards/suggestion_card.dart';
import 'package:flutter/material.dart';

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

            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: "Search Cars...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Select your car brand",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: Text(
                    "Switch to Sell",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
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
    );
  }
}
