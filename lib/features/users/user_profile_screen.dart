import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/constants/url.dart';
import 'package:tiktok_clone/features/users/widgets/user_count.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        slivers: [
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.shade200,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: const TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(Icons.grid_4x4_sharp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: FaIcon(FontAwesomeIcons.heart),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    children: [
                      TabBarView(
                        children: [
                          GestureDetector(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              padding: const EdgeInsets.all(
                                Sizes.size6,
                              ),
                              itemCount: 20,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                      borderRadius:
                                          BorderRadius.circular(Sizes.size4),
                                    ),
                                    child: AspectRatio(
                                      aspectRatio: 9 / 16,
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder:
                                            "assets/images/placeholder.jpg",
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
                          const Center(
                            child: Text("Users"),
                          ),
                        ],
                      ),
                      const Center(
                        child: Text('Page 2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
