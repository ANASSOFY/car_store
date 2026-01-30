import 'package:flutter/material.dart';
import 'car_list_screen.dart';

class SelectCarBrandScreen extends StatelessWidget {
  const SelectCarBrandScreen({super.key});

  static const List<String> brandImages = [
    "assets/images/hyundai.png",
    "assets/images/tata.png",
    "assets/images/honda.png",
    "assets/images/bmw.png",
    "assets/images/audi.png",
    "assets/images/toyota.png",
  ];

  static const List<String> brandNames = [
    "Hyundai",
    "Tata",
    "Honda",
    "BMW",
    "Audi",
    "Toyota",
  ];
  static const
 List<String> suggestionImages = const [
    "assets/images/redcar.jpg",
    "assets/images/testcar.jpg",
    "assets/images/driving.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        title: const Text("Select Car Brand", style: TextStyle(color: Colors.black)),
        actions: const [
          Icon(Icons.notifications_none_outlined, color: Colors.black, size: 28),
          SizedBox(width: 16),
          Icon(Icons.info_outline_rounded, color: Colors.black, size: 28),
          SizedBox(width: 16),
          Icon(Icons.person, color: Colors.black, size: 28),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Search Bar
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search Cars...",
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Grid of Brands
            Expanded(
              child: GridView.builder(
                itemCount: brandImages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarListScreen(brandName: brandNames[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          brandImages[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
             const SizedBox(height: 0.2),

           // Title
Align(
  alignment: Alignment.centerLeft,
  child: Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      "Buy in 3 easy steps",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  ),
),

// Steps List
ListView.separated(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: 3,
  separatorBuilder: (_, __) => const SizedBox(height: 12),
  itemBuilder: (context, index) {
    final steps = [
      {
        "title": "Choose Your Car",
        "desc":
            "Browse cars from top brands and choose the one that fits your needs.",
      },
      {
        "title": "Schedule Test Drive",
        "desc":
            "Pick a date and time to experience the car before buying.",
      },
      {
        "title": "Complete Purchase",
        "desc":
            "Finish the process easily with secure payment options.",
      },
    ];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            suggestionImages[index],
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),

        /// Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step ${index + 1}: ${steps[index]['title']}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                steps[index]['desc']!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  },
),

          
          ],
        ),
      ),
    );
  }
}
