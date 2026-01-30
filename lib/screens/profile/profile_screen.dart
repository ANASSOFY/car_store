import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../models/car_model.dart';
import '../../widgets/listening_page.dart';

class ProfileConfig {
  static const Color backgroundColor = Color(0xFFF8F9FD);
  static const Color whiteColor = Colors.white;
  static const Color primaryIconColor = Color(0xFFFFB74D);
  static const Color textDark = Color(0xFF2D3436);
  static const Color textLight = Color(0xFF9E9E9E);
  static const Color closeBtnColor = Color(0xFF4A4A4A);

  static const double avatarRadius = 50.0;
  static const double headerHeight = 280.0;
}

class ProfilePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String role;

  const ProfilePage({super.key, required this.name, required this.email, required this.phone, required this.role});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _name;
  late String _email;
  late String _phone;
  late String _role;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
    _phone = widget.phone;
    _role = widget.role.isNotEmpty ? widget.role : 'buyer';
  }

  void _editRole() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Account Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Buyer"),
                onTap: () {
                  setState(() => _role = "Buyer");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Seller"),
                onTap: () {
                  setState(() => _role = "Seller");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editUserInfo(String title, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit $title"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Enter new $title",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProfileConfig.backgroundColor,
      body: Column(
        children: [
          // Top Section (Header + Contact Info)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  // Back Arrow Row
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 20, color: ProfileConfig.textDark),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Profile Info Row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar Stack
                      GestureDetector(
                        onTap: () => _showImageSourceActionSheet(context),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: ProfileConfig.avatarRadius,
                              backgroundImage: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : null,
                              child: _profileImage == null
                                  ? const Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.white,
                              )
                                  : null,

                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: ProfileConfig.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.edit, color: ProfileConfig.primaryIconColor, size: 16),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Name and Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _name,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: ProfileConfig.textDark,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      _role,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: ProfileConfig.textLight,
                                      ),
                                    ),

                                  ],
                                ),
                                // Edit Icon
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Contact Info
                  _ContactItem(
                    icon: Icons.phone,
                    text: _phone,
                  ),


                  const SizedBox(height: 15),
                  _ContactItem(
                    icon: Icons.email,
                    text: _email,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Bottom Section (Menu List)
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ProfileConfig.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const _ProfileMenu(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ProfileConfig.primaryIconColor, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: ProfileConfig.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  const _ProfileMenu();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      children: [
        _MenuItem(
          icon: Icons.favorite_border,
          text: "Favorites",
          onTap: () {},
        ),
        _MenuItem(
          icon: Icons.account_balance_wallet_outlined,
          text: "Payments",
          onTap: () {},
        ),
        _MenuItem(
          icon: Icons.person_outline,
          text: "Tell your friends",
          onTap: () {},
        ),
        _MenuItem(
          icon: Icons.edit_outlined,
          text: "Setting",
          onTap: () {},
        ),
        // جوه Column اللي في build() قبل Expanded (قبل القائمة السفلية)
        ElevatedButton(
          onPressed: () {
            final Car demoCar = Car(
              title: "BMW X6",
              subtitle: "2023 • Automatic",
              price: "\$45,000",
              originalPrice: "\$50,000",
              imageUrl: "https://cdn.pixabay.com/photo/2012/05/29/00/43/car-49278_1280.jpg",
              isFavorite: false, id: '1',
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(title: const Text("Test Car Card")),
                  body: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListingPage(

                    ),
                  ),
                ),
              ),
            );
          },
          child: const Text("Test Car Card"),
        ),

        _MenuItem(
          icon: Icons.logout,
          text: "Logout",
          isLast: true,
          onTap: () {},
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool isLast;

  const _MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: isLast ? ProfileConfig.primaryIconColor : ProfileConfig.primaryIconColor, size: 28),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ProfileConfig.textDark,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    );
  }
}
