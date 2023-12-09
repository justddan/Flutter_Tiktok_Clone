import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/repo/authentication_repo.dart';
import 'package:tiktok_clone/features/onboarding/view/interests_screen.dart';
import 'package:tiktok_clone/features/users/view_model/users_view_model.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepo.signUp(
        form["email"],
        form["password"],
      );
      await users.createProfile(
        credential: userCredential,
        email: form["email"],
        name: form["name"],
        birthday: form["birthday"],
      );
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.go(InterestsScreen.routeURL);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
