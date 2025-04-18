import 'package:saheel_portfolio/design/constants/app_constants.dart';
import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:saheel_portfolio/design/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';

// class TechstackDesktopWidget extends StatelessWidget {
//   const TechstackDesktopWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 50),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                   style: const TextStyle(
//                       color: Colors.white, fontFamily: 'Preah', fontSize: 24),
//                   children: [
//                     const TextSpan(
//                         text:
//                             'I have attained expertise in an array of cutting-edge '),
//                     TextSpan(
//                         text: 'tech stacks \n',
//                         style: TextStyle(color: AppColors.purple)),
//                     const TextSpan(
//                         text:
//                             'empowering me to craft seamless and innovative solutions.'),
//                   ]),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               // width: ,
//               child: const Text(
//                 "I have served as the Founder of growmonks, overseeing the entire project lifecycle from ideation to successful client project delivery. As a Flutter Engineer at Tickertape(10M+), where I had the privilege of developing for a huge user base. I gained invaluable experience and deepened my understanding of mobile development concepts.",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Column(
//               children: [
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                         7,
//                         (index) => techStackCircle(
//                             techStackImages.values.toList()[index]))),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget techStackCircle(String imagePath) {
//     return Container(
//       margin: const EdgeInsets.all(6),
//       height: 54,
//       width: 54,
//       padding: const EdgeInsets.all(8),
//       decoration:
//           BoxDecoration(shape: BoxShape.circle, color: AppColors.violet),
//       child: AppImageWidget(
//         path: imagePath,
//       ),
//     );
//   }
// }

class TechstackDesktopWidget extends StatelessWidget {
  const TechstackDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🧠 Headline with RichText
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Preah', fontSize: 24),
                children: [
                  const TextSpan(
                      text:
                          'Over the years, I’ve gained hands-on experience with a diverse range of '),
                  TextSpan(
                    text: 'tech stacks\n',
                    style: TextStyle(color: AppColors.purple),
                  ),
                  const TextSpan(
                      text:
                          'allowing me to build scalable, efficient, and intuitive digital products.'),
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

            const SizedBox(height: 30),

            // 💡 Tech stack title
            Text(
              'Technologies I have worked with:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
              ),
            ),

            const SizedBox(height: 16),

            // 🛠 Tech stack icons
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => techStackCircle(
                      techStackImages.values.toList()[index],
                    ),
                  ),
                ),
              ],
            ),
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
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.violet,
      ),
      child: AppImageWidget(
        path: imagePath,
      ),
    );
  }
}
