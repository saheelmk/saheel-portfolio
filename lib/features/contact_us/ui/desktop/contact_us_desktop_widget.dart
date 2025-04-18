import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class ContactUsDesktopWidget extends StatelessWidget {
  const ContactUsDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '📬 Let’s Connect',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Whether you're building your dream app, exploring AI, or just wanna geek out about Flutter – I’m just one message away 💌",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse("mailto:saheelmk499@gmail.com")),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                'saheelmk499@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.purple,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialIcon(
                'https://www.instagram.com/sa._heel/',
                SocialIconsFlutter.instagram,
              ),
              const SizedBox(width: 16),
              socialIcon(
                'https://github.com/saheelmk',
                SocialIconsFlutter.github,
              ),
              const SizedBox(width: 16),
              socialIcon(
                'https://www.linkedin.com/in/saheelmk/',
                SocialIconsFlutter.linkedin_box,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: Colors.white24),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Designed & Built by Saheel 👨‍💻 in India',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget socialIcon(String link, IconData iconData) {
  return _AnimatedIconButton(
    iconData: iconData,
    link: link,
  );
}

class _AnimatedIconButton extends StatefulWidget {
  final String link;
  final IconData iconData;

  const _AnimatedIconButton({
    required this.link,
    required this.iconData,
  });

  @override
  State<_AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<_AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  bool _isHovered = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => html.window.open(widget.link, '_blank'),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 150),
          scale: _scale,
          curve: Curves.easeOut,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? Colors.purple.withOpacity(0.7)
                      : Colors.transparent,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SocialWidget(
              placeholderText: '',
              iconData: widget.iconData,
              iconSize: 22,
              iconColor: Colors.white,
              link: widget.link,
            ),
          ),
        ),
      ),
    );
  }
}
