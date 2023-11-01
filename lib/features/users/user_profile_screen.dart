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
    return CustomScrollView(
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
              )
            ],
          ),
        )
      ],
    );
  }
}
