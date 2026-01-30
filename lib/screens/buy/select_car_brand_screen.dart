import 'package:car_store/widgets/cards/brand_card.dart';
import 'package:car_store/widgets/cards/suggestion_card.dart';
import 'package:flutter/material.dart';
import 'car_details_screen.dart';

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

    List<String> brandNames = [
      "Hyundai",
      "Tata",
      "Honda",
      "BMW",
      "Audi",
      "Toyota",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        actions: const [
          Icon(Icons.notifications_none_outlined,
              color: Colors.black, size: 30),
          SizedBox(width: 20),
          Icon(Icons.info_outline_rounded, color: Colors.black, size: 30),
          SizedBox(width: 20),
          Icon(Icons.person, color: Colors.black, size: 30),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Search Field
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search, color: Colors.black54),
                  hintText: "Search Cars...",
                  hintStyle: TextStyle(color: Colors.black54.withOpacity(0.7)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// Header + Switch Button
            Row(
              children: [
                const Text(
                  "Select your car brand",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Text(
                    "Switch to Sell",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// GridView للبراندات
            Expanded(
              flex: 1,
              child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: brandImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDetailScreen(
                            carImage: brandImages[index],
                            brandName: brandNames[index],
                            carImages: brandImages,
                          ),
                        ),
                      );
                    },
                    child: BrandCard(image: brandImages[index]),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// Suggestions
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                "Buy in 3 easy steps",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              flex: 1,
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
