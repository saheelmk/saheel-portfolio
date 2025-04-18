import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesMobileWidget extends StatelessWidget {
  const ServicesMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '🚀 My Services',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // Cards Grid
          Column(
            children: [
              ServiceCard(
                title: "Flutter App Development",
                description:
                    "From UI to backend — I craft smooth, scalable Flutter apps tailored to your ideas.",
                url: "https://github.com/saheelmk",
              ),
              const SizedBox(height: 20),
              ServiceCard(
                title: "Open Source - GitHub",
                description:
                    "I actively contribute to open source projects and build tools that help devs worldwide.",
                url: "https://github.com/saheelmk",
              ),
              const SizedBox(height: 20),
              ServiceCard(
                title: "Technical Writing",
                description:
                    "Simplifying complex dev concepts through clean, digestible, and actionable blog content.",
                url: "https://yourwebsite.com/blogs",
              ),
              const SizedBox(height: 20),
              ServiceCard(
                title: "AI Integration",
                description:
                    "Adding OpenAI, GPT, and ML-based features into your products to make them super smart.",
                url: "https://yourwebsite.com/ai",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.purpleDark.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: AppColors.purple.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 10),
            )
          ],
          border: Border.all(
            color: AppColors.purple.withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.white70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
