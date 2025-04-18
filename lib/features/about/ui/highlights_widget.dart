import 'package:saheel_portfolio/features/about/ui/desktop/highlights_desktop_widget.dart';
import 'package:saheel_portfolio/features/about/ui/mobile/highlights_mobile_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HighlightsWidget extends StatelessWidget {
  const HighlightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (context) {
        return const AboutMeDesktopWidget();
      },
      mobile: (p0) {
        return const AboutMeMobileWidget();
      },
    );
  }
}
