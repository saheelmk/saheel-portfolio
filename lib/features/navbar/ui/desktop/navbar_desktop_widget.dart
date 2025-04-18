import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class NavBarDesktopWidget extends StatelessWidget {
  final Function(String section) onItemSelected;
  const NavBarDesktopWidget({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: AppColors.navBarColor,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🧭 Navigation Buttons
          Row(
            children: [
              navButton('Home'),
              navButton('About'),
              navButton('Service'),
              navButton('TechStack'),
              navButton('Contact'),
            ],
          ),

          // 📄 My Resume Button
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.purple),
                foregroundColor: AppColors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                html.window.open(
                  'https://your-resume-link.com', // Replace with your actual resume link
                  '_blank',
                );
              },
              child: const Text('Resume'),
            ),
          ),
        ],
      ),
    );
  }

  Widget navButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: () => onItemSelected(title),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
