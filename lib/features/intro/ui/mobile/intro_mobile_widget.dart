import 'package:saheel_portfolio/design/constants/app_images.dart';
import 'package:saheel_portfolio/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'dart:html' as html;

class IntroMobileWidget extends StatelessWidget {
  const IntroMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // const Align(
          //   alignment: Alignment.topCenter,
          //   child: RiveAnimation.asset(AppAnimations.introAnimation),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImages.selfImage),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Preah',
                        fontSize: 24,
                        height: 1),
                    children: [
                      TextSpan(
                          text: 'Muhammed Saheel ',
                          style: TextStyle(color: AppColors.purple))
                    ]),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialIcon('https://www.instagram.com/sa._heel/',
                        SocialIconsFlutter.instagram),
                    socialIcon('https://github.com/saheelmk',
                        SocialIconsFlutter.github),
                    socialIcon('', SocialIconsFlutter.linkedin_box),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Solo dev. Full stack',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline, fontSize: 14),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontFamily: 'Preah',
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    children: [
                      const TextSpan(text: 'Design. Code. \n '),
                      const TextSpan(text: 'Experience. '),
                      TextSpan(
                          text: 'life',
                          style: TextStyle(color: AppColors.purple)),
                      const TextSpan(text: '...')
                    ]),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "I'm a Software Developer & ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Preah', fontSize: 16),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Preah',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: ' a Tech Enthusiast ',
                              style: TextStyle(
                                  backgroundColor: Colors.cyanAccent,
                                  color: Colors.black)),
                          TextSpan(
                              text: ' who loves sharing his coding journey!')
                        ]),
                  ),
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
