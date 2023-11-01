import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/widgets/views/app_font.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
            title: const Text("니꼬"),
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
                const CircleAvatar(
                  radius: 50,
                  foregroundColor: Colors.blue,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/3612017"),
                  child: Text("니꼬"),
                ),
                Gaps.v20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "@니꼬",
                      style: TextStyle(
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
                      Column(
                        children: [
                          const Text(
                            "97",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16 + Sizes.size2),
                          ),
                          Gaps.v3,
                          Text(
                            "Following",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        width: Sizes.size32,
                        thickness: Sizes.size1,
                        color: Colors.grey.shade400,
                        indent: Sizes.size14,
                        endIndent: Sizes.size14,
                      ),
                      Column(
                        children: [
                          const Text(
                            "10.5M",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16 + Sizes.size2),
                          ),
                          Gaps.v3,
                          Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        width: Sizes.size32,
                        thickness: Sizes.size1,
                        color: Colors.grey.shade400,
                        indent: Sizes.size14,
                        endIndent: Sizes.size14,
                      ),
                      Column(
                        children: [
                          const Text(
                            "194.3M",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size16 + Sizes.size2),
                          ),
                          Gaps.v3,
                          Text(
                            "Likes",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(Sizes.size4)),
                    ),
                    child: const AppFont(
                      "Follow",
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Gaps.v14,
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size32,
                  ),
                  child: AppFont(
                    "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
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
                    AppFont(
                      "https://nomadcoders.co",
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Gaps.v20,
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.shade200,
                        width: .5,
                      ),
                    ),
                  ),
                  child: const TabBar(
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    indicatorColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(Icons.grid_4x4_rounded),
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
              ],
            ),
          )
        ],
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
          child: AppFont(
            "Title!!!!!!",
            color: Colors.white,
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
