import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialTwoPage extends StatelessWidget {
  const TutorialTwoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v80,
        FractionallySizedBox(
          widthFactor: 1,
          child: Text(
            "Follow the rules!",
            style: TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Gaps.v16,
        Text(
          "Take care of one other, Please!",
          style: TextStyle(
            fontSize: Sizes.size20,
          ),
        ),
        Gaps.v20,
      ],
    );
  }
}
