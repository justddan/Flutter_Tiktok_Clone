import 'package:flutter/material.dart';
import 'package:tiktok_clone/common/widgets/views/app_font.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const SafeArea(
          child: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    AppFont(
                      "Watch cool videos!",
                      size: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                    Gaps.v16,
                    AppFont(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      size: Sizes.size20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    AppFont(
                      "Follow the rules!",
                      size: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                    Gaps.v16,
                    AppFont(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      size: Sizes.size20,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    AppFont(
                      "Enjoy the ride!",
                      size: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                    Gaps.v16,
                    AppFont(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      size: Sizes.size20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size48),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  selectedColor: Colors.black38,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
