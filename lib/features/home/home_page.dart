import 'package:saheel_portfolio/features/contact_us/ui/contact_us_widget.dart';
import 'package:saheel_portfolio/features/about/ui/highlights_widget.dart';
import 'package:saheel_portfolio/features/intro/ui/intro_widget.dart';
import 'package:saheel_portfolio/features/navbar/navbar_widget.dart';
import 'package:saheel_portfolio/features/techstack/ui/techstack_widget.dart';
import 'package:saheel_portfolio/features/service/ui/service_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final serviceKey = GlobalKey();
  final techStackKey = GlobalKey();
  final contactKey = GlobalKey();

  final scrollController = ScrollController();

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBarWidget(
            onItemSelected: (section) {
              switch (section) {
                case 'Home':
                  scrollToSection(homeKey);
                  break;
                case 'About':
                  scrollToSection(aboutKey);
                  break;
                case 'Service':
                  scrollToSection(serviceKey);
                  break;
                case 'TechStack':
                  scrollToSection(techStackKey);
                  break;
                case 'Contact':
                  scrollToSection(contactKey);
                  break;
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Container(key: homeKey, child: const IntroWidget()),
                    Container(key: aboutKey, child: const HighlightsWidget()),
                    Container(
                        key: techStackKey, child: const TechStackWidget()),
                    Container(key: serviceKey, child: const ServiceWidget()),
                    Container(key: contactKey, child: const ContactUsWidget()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
