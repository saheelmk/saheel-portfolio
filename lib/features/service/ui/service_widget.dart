import 'package:saheel_portfolio/features/service/ui/desktop/service_desktop_widget.dart';
import 'package:saheel_portfolio/features/service/ui/mobile/service_mobile_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (p0) => ServicesDesktopWidget(),
      mobile: (p0) => ServicesMobileWidget(),
      tablet: (p0) => ServicesDesktopWidget(),
    );
  }
}
