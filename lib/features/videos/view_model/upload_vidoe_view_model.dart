import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repo/authentication_repo.dart';
import 'package:tiktok_clone/features/users/view_model/users_view_model.dart';
import 'package:tiktok_clone/features/videos/model/video_model.dart';
import 'package:tiktok_clone/features/videos/repo/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(videosRepo);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;
    if (userProfile != null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() async {
        final task = await _repository.uploadVideoFile(
          video,
          user!.uid,
        );
        if (task.metadata != null) {
          await _repository.saveVideo(VideoModel(
            title: "From Flutter",
            description: "Hell yeah!",
            fileUrl: await task.ref.getDownloadURL(),
            thumbnailUrl: "",
            creatorUid: user.uid,
            creator: userProfile.name,
            likes: 0,
            comments: 0,
            createdAt: DateTime.now().millisecondsSinceEpoch,
          ));
          context.pushReplacement("/home");
        }
      });
    }
  }
}

final uploadVideoProvider = AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
