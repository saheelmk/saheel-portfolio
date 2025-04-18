import 'package:saheel_portfolio/design/constants/app_constants.dart';
import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:saheel_portfolio/design/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';

class TechstackMobileWidget extends StatelessWidget {
  const TechstackMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Preah', fontSize: 22),
                children: [
                  const TextSpan(
                      text: 'I have hands-on experience with a variety of '),
                  TextSpan(
                      text: 'modern tech stacks ',
                      style: TextStyle(color: AppColors.purple)),
                  const TextSpan(
                      text:
                          'that help me build smooth, scalable, and visually stunning apps.'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🚀 About Me Summary
            const Text(
              "I'm a passionate Flutter Developer with 1.5+ years of experience crafting beautiful, responsive, and scalable mobile applications. "
              "I enjoy turning complex problems into clean and intuitive UIs. Alongside development, I love writing technical blogs and exploring the world of UI/UX design.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.6),
            ),

            const SizedBox(height: 24),

            const Text(
              "Technologies I have worked with:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            const SizedBox(height: 16),
            Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: List.generate(
                    6,
                    (index) =>
                        techStackCircle(techStackImages.values.toList()[index]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget techStackCircle(String imagePath) {
    return Container(
      margin: const EdgeInsets.all(6),
      height: 54,
      width: 54,
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: AppColors.violet),
      child: AppImageWidget(
        path: imagePath,
      ),
    );
  }
}
