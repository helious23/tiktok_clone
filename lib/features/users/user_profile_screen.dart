import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/constants/url.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/widgets/user_count.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('Max16'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundImage: const NetworkImage(GITHUB_AVATAR),
                      child: const Text('Max16'),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '@Max16',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade200,
                        )
                      ],
                    ),
                    Gaps.v24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const UserCount(number: '97', text: 'Following'),
                        SizedBox(
                          height: Sizes.size40,
                          child: VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                        ),
                        const UserCount(number: '10M', text: 'Followers'),
                        SizedBox(
                          height: Sizes.size40,
                          child: VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: Sizes.size10,
                            endIndent: Sizes.size10,
                          ),
                        ),
                        const UserCount(number: '194.3M', text: 'Likes'),
                      ],
                    ),
                    Gaps.v24,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1 / 3,
                          height: Sizes.size48,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Sizes.size2,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Gaps.h4,
                        SizedBox(
                          width: Sizes.size48,
                          height: Sizes.size48,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                                strokeAlign: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Sizes.size2,
                                ),
                              ),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.youtube,
                              ),
                            ),
                          ),
                        ),
                        Gaps.h6,
                        SizedBox(
                          width: Sizes.size48,
                          height: Sizes.size48,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                                strokeAlign: 1,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Sizes.size2,
                                ),
                              ),
                            ),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.caretDown,
                                size: Sizes.size18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        'All highlights and where to watch live matches on FIFA+',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size12,
                        ),
                        Gaps.h4,
                        Text(
                          'https://github.com/helious23',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GestureDetector(
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.zero,
                  itemCount: 21,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 14,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/placeholder.jpg",
                              image:
                                  "https://images.unsplash.com/photo-1531804159968-24716780d214?auto=format&fit=crop&q=80&w=1288&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            ),
                          ),
                          const Positioned(
                            bottom: Sizes.size4,
                            left: 8,
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.play,
                                  color: Colors.white,
                                  size: Sizes.size12,
                                ),
                                Gaps.h8,
                                Text(
                                  '4.1M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size18,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text('Page 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
