import 'package:flutter/material.dart';

class ProfileFollowers extends StatelessWidget {
  const ProfileFollowers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          '200K',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Followers',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
