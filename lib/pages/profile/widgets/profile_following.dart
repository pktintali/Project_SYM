import 'package:flutter/material.dart';

class ProfileFollowings extends StatelessWidget {
  const ProfileFollowings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          '78',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Followings',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
