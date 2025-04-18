import 'package:saheel_portfolio/design/constants/app_images.dart';
import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:saheel_portfolio/design/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';

class AboutMeMobileWidget extends StatelessWidget {
  const AboutMeMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 100),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 200,
                    spreadRadius: 200,
                    color: AppColors.purple.withOpacity(0.4),
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Me',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // 👤 Who am I section
              const Text(
                'Who am I?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                "I'm Muhammad Saheel, a Flutter Developer, Technical Blog Writer, and UI/UX Designer. "
                "I've been working with Flutter for the past 1.5 years and have built several applications for both Android and iOS. "
                "I'm passionate about writing blogs to share what I learn and help others grow along with me.",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),

              const SizedBox(height: 30),

              // 🧱 Card-based Highlights
              Column(
                children: [
                  HoverableAboutMeCard(
                    context: context,
                    title: 'Tech Enthusiast',
                    imagePath: AppImages.bulbImage,
                    description:
                        "I'm a self-driven developer who loves building cool apps and exploring new tech every day.",
                  ),
                  const SizedBox(height: 12),
                  HoverableAboutMeCard(
                    context: context,
                    title: 'Lifelong Learner',
                    imagePath: AppImages.bookmarkImage,
                    description:
                        "Always learning — from DSA to Flutter to AI — and sharing that journey with the world.",
                  ),
                  const SizedBox(height: 12),
                  HoverableAboutMeCard(
                    context: context,
                    title: 'Builder at Heart',
                    imagePath: AppImages.cupImage,
                    description:
                        "I enjoy turning ideas into real, working apps. Code is my favorite tool for solving problems.",
                  ),
                  const SizedBox(height: 12),
                  HoverableAboutMeCard(
                    context: context,
                    title: 'Coding Journey',
                    imagePath: AppImages.pickerImage,
                    description:
                        "From simple apps to deep dives into algorithms, my goal is to grow every day as a developer.",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HoverableAboutMeCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;
  final BuildContext context;

  const HoverableAboutMeCard({
    required this.context,
    required this.title,
    required this.imagePath,
    required this.description,
    super.key,
  });

  @override
  State<HoverableAboutMeCard> createState() => _HoverableAboutMeCardState();
}

class _HoverableAboutMeCardState extends State<HoverableAboutMeCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.purpleDark.withOpacity(0.7)
              : AppColors.purpleDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.purple.withOpacity(0.7)
                  : Colors.transparent,
              blurRadius: _isHovered ? 15 : 8,
              spreadRadius: 3,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImageWidget(
              imageWidth: 60,
              imageHeight: 60,
              path: widget.imagePath,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
