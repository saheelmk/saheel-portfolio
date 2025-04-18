import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class ContactUsMobileWidget extends StatelessWidget {
  const ContactUsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '📬 Let’s Connect',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Whether you're a dev, founder, or just vibin' with tech — feel free to drop me a message. I'm all ears 👂",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse("mailto:saheelmk499@gmail.com")),
            child: Text(
              'saheelmk499@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.purple,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialIcon('https://www.instagram.com/sa._heel/',
                  SocialIconsFlutter.instagram),
              const SizedBox(width: 12),
              socialIcon(
                  'https://github.com/saheelmk', SocialIconsFlutter.github),
              const SizedBox(width: 12),
              socialIcon('https://www.linkedin.com/in/saheelmk/',
                  SocialIconsFlutter.linkedin_box),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          const Text(
            'Coded by Saheel with 💙 from India',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget socialIcon(String link, IconData iconPath) {
    return InkWell(
      onTap: () => html.window.open(link, '_blank'),
      child: SocialWidget(
        placeholderText: '',
        iconData: iconPath,
        iconSize: 22,
        iconColor: Colors.white,
        link: link,
      ),
    );
  }
}
