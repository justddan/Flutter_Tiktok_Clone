import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileInfo extends StatelessWidget {
  final String amount;
  final String title;
  const UserProfileInfo({
    super.key,
    required this.amount,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          amount,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size16 + Sizes.size2,
          ),
        ),
        Gaps.v3,
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
