import 'package:flutter/material.dart';
import 'package:saheel_portfolio/design/utils/app_colors.dart';

class NavBarMobileWidget extends StatelessWidget {
  final Function(String section) onItemSelected;
  const NavBarMobileWidget({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.navBarColor,
      title: const Text('My Portfolio', style: TextStyle(color: Colors.white)),
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: AppColors.navBarColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    navItem(context, 'Home'),
                    navItem(context, 'About'),
                    navItem(context, 'Service'),
                    navItem(context, 'TechStack'),
                    navItem(context, 'Contact'),
                    const SizedBox(height: 16),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget navItem(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // close the bottom sheet
        onItemSelected(title); // trigger scroll
      },
    );
  }
}
