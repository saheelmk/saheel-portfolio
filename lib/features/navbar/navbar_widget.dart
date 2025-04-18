import 'package:saheel_portfolio/features/navbar/ui/desktop/navbar_desktop_widget.dart';
import 'package:saheel_portfolio/features/navbar/ui/mobile/navbar_mobile_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarWidget extends StatelessWidget {
  final Function(String section) onItemSelected;
  const NavBarWidget({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (p0) => NavBarDesktopWidget(onItemSelected: onItemSelected),
      tablet: (p0) => NavBarMobileWidget(onItemSelected: onItemSelected),
      mobile: (p0) => NavBarMobileWidget(onItemSelected: onItemSelected),
    );
  }
}
