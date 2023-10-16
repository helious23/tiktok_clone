import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoTag extends StatelessWidget {
  const VideoTag({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      tag,
      trimLines: 1,
      colorClickableText: Colors.white,
      trimMode: TrimMode.Line,
      trimCollapsedText: ' See more',
      trimExpandedText: ' Less',
      style: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16,
        fontWeight: FontWeight.bold,
      ),
      moreStyle: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16,
        fontWeight: FontWeight.bold,
      ),
      lessStyle: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.size16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
