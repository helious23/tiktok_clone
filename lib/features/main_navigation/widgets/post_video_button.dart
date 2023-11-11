import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PostVideoButton extends StatelessWidget {
  final bool buttonTap;
  final bool inverted;

  const PostVideoButton({
    super.key,
    required this.buttonTap,
    required this.inverted,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 22,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 32,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: buttonTap
                  ? Theme.of(context).primaryColor
                  : const Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Positioned(
          left: 22,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 32,
            width: 25,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size8,
            ),
            decoration: BoxDecoration(
              color: buttonTap
                  ? const Color(0xff61D4F0)
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          decoration: BoxDecoration(
            color: !inverted || isDark ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(
              Sizes.size6,
            ),
          ),
          height: 32,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: !inverted || isDark ? Colors.black : Colors.white,
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}
