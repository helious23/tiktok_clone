import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final List tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  String _keyword = '';

  bool _isWriting = false;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _keyword = _textEditingController.text;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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

  void _onClearTap() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.5,
          title: SizedBox(
            height: Sizes.size40,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              onTap: _onStartWriting,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    Sizes.size3,
                  ),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: Sizes.size14,
                    top: Sizes.size8,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.grey.shade900,
                    size: Sizes.size20,
                  ),
                ),
                suffix: GestureDetector(
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
          bottom: TabBar(
            onTap: (value) => _stopWriting(),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GestureDetector(
              onTap: _stopWriting,
              child: RefreshIndicator(
                color: Theme.of(context).primaryColor,
                onRefresh: _onRefresh,
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.all(
                    Sizes.size6,
                  ),
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: Sizes.size10,
                    mainAxisSpacing: Sizes.size10,
                    childAspectRatio: 9 / 20,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size4),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: "assets/images/placeholder.jpg",
                            image:
                                "https://images.unsplash.com/photo-1531804159968-24716780d214?auto=format&fit=crop&q=80&w=1288&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          ),
                        ),
                      ),
                      Gaps.v10,
                      const Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ornare vel urna nec varius.",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v8,
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: Sizes.size14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/78624290?v=4',
                              ),
                            ),
                            Gaps.h4,
                            const Expanded(
                              child: Text(
                                " Donec tortor est, tempus vitae tempus non, mollis eget turpis.",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            const Text(
                              "2.5M",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Center(
              child: Text("Users"),
            ),
            for (var tab in tabs.skip(2))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size48,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}