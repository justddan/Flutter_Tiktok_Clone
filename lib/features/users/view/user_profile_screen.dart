import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/view/modify_screen.dart';
import 'package:tiktok_clone/features/settings/view/settings_screen.dart';
import 'package:tiktok_clone/features/users/view/widgets/avatar.dart';
import 'package:tiktok_clone/features/users/view/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/users/view/widgets/user_profile_info.dart';
import 'package:tiktok_clone/features/users/view_model/users_view_model.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  final String username;
  final String tab;
  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  void _onPencilPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ModifyScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(usersProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) {
            return Scaffold(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              body: SafeArea(
                child: DefaultTabController(
                  initialIndex: widget.tab == "likes" ? 1 : 0,
                  length: 2,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverAppBar(
                          title: Text(data.name),
                          actions: [
                            IconButton(
                              onPressed: _onPencilPressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.pencil,
                                size: Sizes.size20,
                              ),
                            ),
                            IconButton(
                              onPressed: _onGearPressed,
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
                              Gaps.v20,
                              Avartar(
                                name: data.name,
                                uid: data.uid,
                                hasAvatar: data.hasAvatar,
                              ),
                              Gaps.v20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "@${data.name}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: Sizes.size16 + Sizes.size2),
                                  ),
                                  Gaps.h5,
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: Sizes.size16,
                                    color: Colors.blue.shade500,
                                  ),
                                ],
                              ),
                              Gaps.v24,
                              SizedBox(
                                height: Sizes.size48,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const UserProfileInfo(
                                      amount: "97",
                                      title: "Following",
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      color: Colors.grey.shade400,
                                      indent: Sizes.size14,
                                      endIndent: Sizes.size14,
                                    ),
                                    const UserProfileInfo(
                                      amount: "10.5M",
                                      title: "Followers",
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      color: Colors.grey.shade400,
                                      indent: Sizes.size14,
                                      endIndent: Sizes.size14,
                                    ),
                                    const UserProfileInfo(
                                      amount: "194.3M",
                                      title: "Likes",
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.v14,
                              FractionallySizedBox(
                                widthFactor: 0.33,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(Sizes.size4)),
                                  ),
                                  child: const Text(
                                    "Follow",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Gaps.v14,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size32,
                                ),
                                child: Text(
                                  data.bio,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gaps.v14,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const FaIcon(
                                    FontAwesomeIcons.link,
                                    size: Sizes.size12,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    data.link.isNotEmpty
                                        ? data.link
                                        : "No link",
                                    style: const TextStyle(
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
                          pinned: true,
                          delegate: PersistentTabBar(),
                        ),
                      ];
                    },
                    body: TabBarView(
                      children: [
                        GridView.builder(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: 20,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: Sizes.size2,
                            mainAxisSpacing: Sizes.size2,
                            childAspectRatio: 9 / 14,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 9 / 14,
                                      child: FadeInImage.assetNetwork(
                                        fit: BoxFit.cover,
                                        placeholder:
                                            "assets/images/placeholder.jpg",
                                        image:
                                            "https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80",
                                      ),
                                    ),
                                    const Positioned(
                                      left: 5,
                                      bottom: 5,
                                      child: Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.solidCirclePlay,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                          Gaps.h5,
                                          Text(
                                            "4.1M",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        const Center(
                          child: Text("Page Two"),
                        )
                      ],
                    ),
                  ),
                  /*
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // floating: true,
                // snap: true,
                // stretch: true,
                // pinned: true,
                backgroundColor: Colors.teal,
                collapsedHeight: 80,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                  background: Image.asset(
                    "assets/images/placeholder.jpg",
                    fit: BoxFit.cover,
                  ),
                  title: const Text("Hello!"),
                ),
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 20,
                    )
                  ],
                ),
              ),
              SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 50,
                  (context, index) => Container(
                    color: Colors.amber[100 * (index % 9)],
                    child: Align(
                        alignment: Alignment.center, child: Text("Items $index")),
                  ),
                ),
                itemExtent: 50,
              ),
              SliverPersistentHeader(
                delegate: CustomDelegate(),
                // pinned: true,
                floating: true,
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 50,
                  (context, index) => Container(
                    color: Colors.blue[100 * (index % 9)],
                    child: Align(
                        alignment: Alignment.center, child: Text("Items $index")),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisSpacing: Sizes.size20,
                  crossAxisSpacing: Sizes.size20,
                  childAspectRatio: 1,
                ),
              ),
            ],
          )
          */
                ),
              ),
            );
          },
        );
  }
}

/*
class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text(
            "Title!!!!!!",
            style: TextStyle(
                            color: Colors.white,
                          ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
*/
