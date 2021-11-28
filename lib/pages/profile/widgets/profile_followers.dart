import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/user_followings_list.dart';

class ProfileFollowers extends StatelessWidget {
  final int followersCount;
  final int userID;
  const ProfileFollowers(
      {Key? key, required this.followersCount, required this.userID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (followersCount != 0) {
          Get.to(() => UserFollowersList(userID: userID));
        }
      },
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
            'Followers',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
