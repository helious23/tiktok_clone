import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/constants/url.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController scrollController = ScrollController();
    final isDark = isDarkMode(context);

    return Container(
      height: size.height * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Scaffold(
        backgroundColor: isDark ? null : Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: isDark ? null : Colors.grey.shade50,
          title: Text(
            S.of(context).commentTitle(2, 2),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(
                FontAwesomeIcons.xmark,
              ),
            )
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                Scrollbar(
                  controller: scrollController,
                  child: ListView.separated(
                    controller: scrollController,
                    separatorBuilder: (context, index) => Gaps.v20,
                    padding: const EdgeInsets.only(
                      top: Sizes.size10,
                      left: Sizes.size16,
                      right: Sizes.size16,
                      bottom: Sizes.size96 + Sizes.size20,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0.5),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: Sizes.size18,
                            backgroundColor: isDark
                                ? Colors.grey.shade500
                                : Theme.of(context).primaryColor,
                            foregroundImage: const NetworkImage(GITHUB_AVATAR),
                            child: const Text("Max"),
                          ),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Max",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size14,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              Gaps.v3,
                              const Text(
                                  "소율이와 함께 슈퍼바이킹🎢 보기만 해도 무섭고 어지러워 😵‍💫 어떻게 웃으면서 타는 거지?? 🧐")
                            ],
                          ),
                        ),
                        Gaps.h10,
                        Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.grey.shade500,
                              size: Sizes.size20,
                            ),
                            Gaps.v2,
                            Text(
                              S.of(context).commentLike(52222),
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: constraints.maxWidth,
                  bottom: 0,
                  child: BottomAppBar(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                        vertical: Sizes.size10,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: isDark
                                ? Colors.grey.shade900
                                : Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            foregroundImage: const NetworkImage(GITHUB_AVATAR),
                            child: const Text('Max'),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: SizedBox(
                              height: Sizes.size44,
                              child: TextField(
                                onTap: _onStartWriting,
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: S.of(context).addComment,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      Sizes.size10,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      right: Sizes.size14,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.at,
                                          color: isDark
                                              ? Colors.grey.shade500
                                              : Colors.grey.shade900,
                                        ),
                                        Gaps.h12,
                                        FaIcon(
                                          FontAwesomeIcons.gift,
                                          color: isDark
                                              ? Colors.grey.shade500
                                              : Colors.grey.shade900,
                                        ),
                                        Gaps.h12,
                                        FaIcon(
                                          FontAwesomeIcons.faceSmile,
                                          color: isDark
                                              ? Colors.grey.shade500
                                              : Colors.grey.shade900,
                                        ),
                                        Gaps.h12,
                                        if (_isWriting)
                                          GestureDetector(
                                            onTap: _stopWriting,
                                            child: FaIcon(
                                              FontAwesomeIcons.circleArrowUp,
                                              color: isDark
                                                  ? Colors.grey.shade50
                                                  : Theme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                textInputAction: TextInputAction.newline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
