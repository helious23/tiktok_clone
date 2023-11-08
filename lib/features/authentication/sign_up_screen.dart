import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTab(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  const Text(
                    'Sign up for TikTok',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    'Create a profile, follow other accounts, make your own videos, and more.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.user),
                      text: "Use email & password",
                      targetWidget: UsernameScreen(),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.facebook),
                      text: "Continue with Facebook",
                      targetWidget: UsernameScreen(),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.google),
                      text: "Continue with Google",
                      targetWidget: UsernameScreen(),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.apple),
                      text: "Continue with Apple",
                      targetWidget: UsernameScreen(),
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    const Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            icon: FaIcon(FontAwesomeIcons.user),
                            text: "Use email & password",
                            targetWidget: UsernameScreen(),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: FaIcon(FontAwesomeIcons.facebook),
                            text: "Continue with Facebook",
                            targetWidget: UsernameScreen(),
                          ),
                        ),
                      ],
                    ),
                  Gaps.v16,
                  const Row(
                    children: [
                      Expanded(
                        child: AuthButton(
                          icon: FaIcon(FontAwesomeIcons.google),
                          text: "Continue with Google",
                          targetWidget: UsernameScreen(),
                        ),
                      ),
                      Gaps.h16,
                      Expanded(
                        child: AuthButton(
                          icon: FaIcon(FontAwesomeIcons.apple),
                          text: "Continue with Apple",
                          targetWidget: UsernameScreen(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTab(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
