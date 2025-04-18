import 'package:saheel_portfolio/core/config/environment.dart';
import 'package:saheel_portfolio/design/utils/app_theme.dart';
import 'package:saheel_portfolio/features/home/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  Environment.initialize(flavour: Flavour.production);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      title: 'Muhammed Saheel👋 | Developer & Learner',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
