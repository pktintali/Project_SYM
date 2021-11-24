import 'package:flutter/material.dart';

class ProfileFollowings extends StatelessWidget {
  final int followersCount;
  const ProfileFollowings({Key? key, required this.followersCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            '$followersCount',
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            'Followings',
          ),
        ],
      ),
    );
  }
}
