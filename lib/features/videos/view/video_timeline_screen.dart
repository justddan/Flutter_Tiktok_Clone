import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view/widgets/video_post.dart';
import 'package:tiktok_clone/features/videos/view_model/timeline_view_model.dart';

class VideoTimelineScreen extends ConsumerStatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  ConsumerState<VideoTimelineScreen> createState() =>
      VideoTimelineScreenState();
}

class VideoTimelineScreenState extends ConsumerState<VideoTimelineScreen> {
  int _itemCount = 4;

  final PageController _pageController = PageController();

  final Duration _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
  ];

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      colors.addAll([
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.green,
      ]);
      setState(() {});
    }
  }

  void _onVideoFinished() {
    return;
    // _pageController.nextPage(
    //   duration: _scrollDuration,
    //   curve: _scrollCurve,
    // );
  }

  Future<void> _onRefresh() {
    return Future.delayed(
      const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(timelineProvider).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: Text(
              "Could not load videos: $error",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          data: (videos) => RefreshIndicator(
            onRefresh: _onRefresh,
            displacement: 50,
            edgeOffset: 20,
            color: Theme.of(context).primaryColor,
            child: PageView.builder(
              controller: _pageController,
              itemCount: videos.length,
              itemBuilder: (context, index) => VideoPost(
                onVideoFinished: _onVideoFinished,
                index: index,
              ),
              onPageChanged: _onPageChanged,
              scrollDirection: Axis.vertical,
            ),
          ),
        );
  }
}
