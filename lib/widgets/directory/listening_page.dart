
// import 'package:flutter/material.dart';
// import '../../models/car_model.dart';
// import '../cards/car_card.dart';

// class ListingPage extends StatefulWidget {
//   const ListingPage({super.key});

//   @override
//   State<ListingPage> createState() => _ListingPageState();
// }

// class _ListingPageState extends State<ListingPage> {
//   // --- State Variables ---
//   bool isSellerMode = false;
//   String selectedLocation = "UAE";
//   String sortBy = "Relevance";
//   String filterBy = "All";

//   // Dummy Data for Cars (500 items logic simulation)
//   // In a real app, this would come from an API with pagination
//   final List<Car> _allCars = List.generate(
//     10, // Generating 10 for demo, but displaying "500" in text
//         (index) => Car(
//       id: index.toString(),
//       imageUrl: 'https://imgd.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-109.jpeg?isig=0&q=80', // Placeholder
//       title: index % 2 == 0 ? "2015 Maruti wagon" : "2018 Suzuki Swift",
//       subtitle: "43,721 km - petrol - manual",
//       price: "鈧�3.${11 + index} Lakh",
//       originalPrice: "鈧�3.${26 + index} Lakh",
//       isFavorite: index == 1,
//     ),
//   );

//   // Available locations
//   final List<String> locations = ["UAE", "USA", "India", "UK", "Canada"];

//   // --- Logic Methods ---

//   void _toggleMode() {
//     setState(() {
//       isSellerMode = !isSellerMode;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Switched to ${isSellerMode ? 'Seller' : 'Buyer'} mode")),
//     );
//   }

//   void _showSortOptions() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text("Sort By", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const Divider(),
//               ListTile(
//                 title: const Text("Price: Low to High"),
//                 onTap: () {
//                   setState(() => sortBy = "Price Low");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text("Price: High to Low"),
//                 onTap: () {
//                   setState(() => sortBy = "Price High");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text("Newest First"),
//                 onTap: () {
//                   setState(() => sortBy = "Newest");
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showFilterOptions() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text("Filter By Brand", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const Divider(),
//               ListTile(
//                 title: const Text("Maruti"),
//                 onTap: () {
//                   setState(() => filterBy = "Maruti");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text("Suzuki"),
//                 onTap: () {
//                   setState(() => filterBy = "Suzuki");
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text("All"),
//                 onTap: () {
//                   setState(() => filterBy = "All");
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _changeLocation() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Select Location"),
//           content: DropdownButton<String>(
//             value: selectedLocation,
//             isExpanded: true,
//             items: locations.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             onChanged: (newValue) {
//               if (newValue != null) {
//                 setState(() => selectedLocation = newValue);
//                 Navigator.pop(context);
//               }
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Match image bg
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () {
//             if (Navigator.canPop(context)) Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border, color: Colors.amber, size: 28),
//             onPressed: () {},
//           ),
//           const SizedBox(width: 10),
//         ],
//       ),
//       body: Column(
//         children: [
//           // 1. Search Bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 border: Border.all(color: Colors.grey.shade400),
//               ),
//               child: const TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search Cars...",
//                   prefixIcon: Icon(Icons.search, color: Colors.grey), // Actually image shows text then icon at end usually, but standard is prefix. Image shows icon at right.
//                   suffixIcon: Icon(Icons.search, color: Colors.black),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//                   prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0), // Hide prefix if not needed
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 15),

//           // 2. Filter, Sort, Location Row
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 // Filters
//                 _buildActionButton(
//                     icon: Icons.tune,
//                     label: "Filters",
//                     onTap: _showFilterOptions
//                 ),
//                 const SizedBox(width: 10),
//                 // Sort (Highlighted)
//                 _buildActionButton(
//                     icon: Icons.swap_vert,
//                     label: "Sort",
//                     color: const Color(0xFFFFE082), // Light amber
//                     onTap: _showSortOptions
//                 ),
//                 const Spacer(),
//                 // Location
//                 GestureDetector(
//                   onTap: _changeLocation,
//                   child: Row(
//                     children: [
//                       const Icon(Icons.location_on_outlined, color: Colors.amber),
//                       const SizedBox(width: 4),
//                       Text(
//                         "Change location ($selectedLocation)",
//                         style: const TextStyle(fontSize: 12, color: Color(0xFF2D3436)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 20),

//           // 3. Count & Switch Button
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "500 used car in your location",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF2D3436),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: _toggleMode,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFFFC107), // Deep Amber
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                   ),
//                   child: Text(
//                     isSellerMode ? "Switch to Buy" : "Switch to Sell",
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 15),

//           // 4. Car Grid
//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(20),
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.72, // Adjust to match card height
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 15,
//               ),
//               itemCount: _allCars.length,
//               itemBuilder: (context, index) {
//                 return CarCard(
//                   imageUrl: _allCars[index].imageUrl,
//                   name: _allCars[index].title,
//                   details: _allCars[index].subtitle,
//                   price: _allCars[index].price,
//                   onBuyTap: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Buying ${_allCars[index].title}"))
//                     );
//                   },
//                   onFavoriteTap: () {
//                     setState(() {
//                       _allCars[index].isFavorite = !_allCars[index].isFavorite;
//                     });
//                   },
//                   car: _allCars[index],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActionButton({required IconData icon, required String label, Color? color, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           color: color ?? Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           border: color == null ? Border.all(color: Colors.grey.shade300) : null,
//         ),
//         child: Row(
//           children: [
//             Icon(icon, size: 16, color: Colors.black54),
//             const SizedBox(width: 6),
//             Text(
//               label,
//               style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }