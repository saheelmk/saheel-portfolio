import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesDesktopWidget extends StatelessWidget {
  const ServicesDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '💼 My Services',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),

          // First Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServiceCard(
                title: "Flutter App Development",
                description:
                    "From architecture to deployment, I create robust, responsive, and beautiful Flutter apps that scale.",
                url: "https://github.com/saheelmk",
              ),
              const SizedBox(width: 40),
              ServiceCard(
                title: "Open Source - GitHub",
                description:
                    "I actively contribute to open source, sharing tools, libraries, and ideas to uplift the dev community.",
                url: "https://github.com/saheelmk",
              ),
            ],
          ),
          const SizedBox(height: 40),

          // Second Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ServiceCard(
                title: "Technical Writing",
                description:
                    "I simplify complex dev concepts through insightful, easy-to-follow technical articles and tutorials.",
                url: "https://yourwebsite.com/blogs",
              ),
              const SizedBox(width: 40),
              ServiceCard(
                title: "AI Integration",
                description:
                    "Integrating AI features using OpenAI, GPT models, and machine learning APIs to make smart apps smarter.",
                url: "https://yourwebsite.com/ai",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
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
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 400,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.purpleDark.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.purple.withOpacity(0.7)
                    : AppColors.purple.withOpacity(0.3),
                blurRadius: _isHovered ? 50 : 30,
                spreadRadius: _isHovered ? 8 : 3,
                offset: const Offset(0, 10),
              )
            ],
            border: Border.all(
              color: _isHovered
                  ? AppColors.purple.withOpacity(0.8)
                  : Colors.transparent,
              width: 1.2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
