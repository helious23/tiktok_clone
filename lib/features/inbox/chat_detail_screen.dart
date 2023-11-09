import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/constants/url.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // ignore: unused_field
  bool _isWriting = false;

  String _message = "";

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _message = _textEditingController.text;
      });
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onClearTap() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(GITHUB_AVATAR),
                child: Text("Max16"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: Sizes.size20,
                  height: Sizes.size20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.white,
                      width: Sizes.size4,
                    ),
                  ),
                ),
              )
            ],
          ),
          title: const Text(
            "Max16",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active Now'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _stopWriting,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                children: [
                  Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(
                        top: Sizes.size20,
                        left: Sizes.size16,
                        right: Sizes.size16,
                        bottom: Sizes.size96,
                      ),
                      itemBuilder: (context, index) {
                        final isMine = index % 2 == 0;
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: isMine
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(
                                Sizes.size14,
                              ),
                              decoration: BoxDecoration(
                                color: isMine
                                    ? Colors.blue
                                    : Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(
                                    Sizes.size20,
                                  ),
                                  topRight: const Radius.circular(
                                    Sizes.size20,
                                  ),
                                  bottomLeft: Radius.circular(
                                    isMine ? Sizes.size20 : Sizes.size5,
                                  ),
                                  bottomRight: Radius.circular(
                                    !isMine ? Sizes.size20 : Sizes.size5,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'This is message!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.size16,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => Gaps.v10,
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    width: constraints.maxWidth,
                    child: BottomAppBar(
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.size10,
                          vertical: Sizes.size10,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _textEditingController,
                                onTap: _onStartWriting,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                  ),
                                  hintText: "Send a message...",
                                  hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        Sizes.size20,
                                      ),
                                      topRight: Radius.circular(
                                        Sizes.size20,
                                      ),
                                      bottomLeft: Radius.circular(
                                        Sizes.size20,
                                      ),
                                      bottomRight: Radius.circular(
                                        Sizes.size5,
                                      ),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffix: _message.isEmpty
                                      ? const SizedBox()
                                      : GestureDetector(
                                          onTap: _onClearTap,
                                          child: FaIcon(
                                            FontAwesomeIcons.solidCircleXmark,
                                            color: Colors.grey.shade500,
                                            size: Sizes.size20,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Gaps.h20,
                            GestureDetector(
                              onTap: _onClearTap,
                              child: Container(
                                width: Sizes.size40,
                                height: Sizes.size40,
                                decoration: BoxDecoration(
                                  color: _message.isEmpty
                                      ? Colors.grey.shade300
                                      : Colors.blue,
                                  borderRadius: BorderRadius.circular(
                                    Sizes.size56,
                                  ),
                                ),
                                child: const Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.paperPlane,
                                    color: Colors.white,
                                  ),
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
      ),
    );
  }
}
