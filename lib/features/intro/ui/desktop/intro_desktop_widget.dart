import 'dart:ui';

import 'package:saheel_portfolio/design/constants/app_animations.dart';
import 'package:saheel_portfolio/design/constants/app_images.dart';
import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

class IntroDesktopWidget extends StatelessWidget {
  const IntroDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: w / 30),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomRight,
            child: RiveAnimation.asset(
              AppAnimations.intrAnimation1,
              fit: BoxFit.contain,
            ),
          ),
          // Add a blur effect (optional, for a smoother background)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 0.9), // Blur effect
              child: Container(
                color: Colors.black.withOpacity(0.0), // Slightly dark overlay
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Row(
                children: [
                  CircleAvatar(
                    radius: w / 14,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: w / 14 - 4,
                      backgroundImage: const AssetImage(AppImages.selfImage),
                    ),
                  ),
                  const SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(
                                        0.6), // Add shadow for contrast
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                                color: Colors.white,
                                fontFamily: 'Preah',
                                fontSize: w / 40),
                            children: [
                              const TextSpan(text: 'I am '),
                              TextSpan(
                                  text: 'Muhammed Saheel ',
                                  style: TextStyle(color: AppColors.purple))
                            ]),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Solo dev. Full stack. Full heart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black.withOpacity(
                                        0.6), // Add shadow for contrast
                                    offset: Offset(3.0, 3.0),
                                  ),
                                ],
                                color: Colors.white,
                                height: 1.2,
                                fontFamily: 'Preah',
                                fontSize: w / 20,
                                fontWeight: FontWeight.bold),
                            children: [
                              const TextSpan(text: 'Design. Code. \n'),
                              const TextSpan(text: 'Experience. '),
                              TextSpan(
                                  text: 'life',
                                  style: TextStyle(color: AppColors.purple)),
                              const TextSpan(text: '...')
                            ]),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I'm a Software Developer & ",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black
                                .withOpacity(0.6), // Add shadow for contrast
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                        color: Colors.white,
                        height: 1.2,
                        fontFamily: 'Preah',
                        fontSize: w / 28),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black.withOpacity(
                                    0.6), // Add shadow for contrast
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                            color: Colors.white,
                            height: 1.2,
                            fontFamily: 'Preah',
                            fontSize: w / 44,
                            fontWeight: FontWeight.bold),
                        children: const [
                          TextSpan(
                              text: ' a Tech Enthusiast ',
                              style: TextStyle(
                                  backgroundColor: Colors.cyanAccent,
                                  color: Colors.black)),
                          TextSpan(
                              text: ' who loves sharing his coding journey!')
                        ]),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Row(
                      children: [
                        socialIcon('https://www.instagram.com/sa._heel/',
                            SocialIconsFlutter.instagram),
                        socialIcon('https://github.com/saheelmk',
                            SocialIconsFlutter.github),
                        socialIcon('', SocialIconsFlutter.linkedin_box),
                      ],
                    ),
                  )
                ],
              )
            ],
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
