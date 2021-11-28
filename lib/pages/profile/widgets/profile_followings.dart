import 'package:flutter/material.dart';

class ProfileFollowings extends StatelessWidget {
  const ProfileFollowings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: const [
          Text(
            '0',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 5),
          Text(
            'Followings',
          ),
        ],
      ),
    );
  }
}
