import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/authentication/view/widgets/form_button.dart';
import 'package:tiktok_clone/features/users/view_model/users_view_model.dart';

class ModifyScreen extends ConsumerStatefulWidget {
  const ModifyScreen({super.key});

  @override
  ConsumerState<ModifyScreen> createState() => _ModifyScreenState();
}

class _ModifyScreenState extends ConsumerState<ModifyScreen> {
  late final TextEditingController _bioController;
  late final TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    _bioController = TextEditingController();
    _linkController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _bioController.dispose();
    _linkController.dispose();
  }

  void _onSubmitTap() async {
    await ref
        .read(usersProvider.notifier)
        .updateProfile(_bioController.text, _linkController.text);
    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modify"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextField(
                    controller: _bioController,
                    decoration: const InputDecoration(
                      hintText: "Bio",
                    ),
                  ),
                  Gaps.v16,
                  TextField(
                    controller: _linkController,
                    decoration: const InputDecoration(
                      hintText: "Link",
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: _onSubmitTap,
                child: FormButton(
                  disabled: ref.watch(usersProvider).isLoading,
                  text: "Confirm",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
