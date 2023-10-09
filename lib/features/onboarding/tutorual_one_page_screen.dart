import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialOnePage extends StatelessWidget {
  const TutorialOnePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v80,
        Column(
          children: [
            Text(
              "Watch cool videos!",
              style: TextStyle(
                fontSize: Sizes.size40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            Text(
              "Videos are personalized for you based on what you watch, like, and share.",
              style: TextStyle(
                fontSize: Sizes.size20,
              ),
            ),
          ],
        ),
        Gaps.v20,
      ],
    );
  }
}
