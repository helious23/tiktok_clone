import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoBgmInfo extends StatelessWidget {
  const VideoBgmInfo({
    super.key,
    required this.bgmInfo,
  });

  final String bgmInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '♫',
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16,
          ),
        ),
        Gaps.h10,
        Expanded(
          child: Marquee(
            text: bgmInfo,
            pauseAfterRound: const Duration(milliseconds: 500),
            style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16,
            ),
            blankSpace: Sizes.size20,
            velocity: 50,
          ),
        ),
      ],
    );
  }
}
