import 'package:flutter/material.dart';
import 'package:project_sym/models/user.dart';

class MisCardUserHeader extends StatelessWidget {
  final String timeStamp;
  final User user;
  const MisCardUserHeader({Key? key, required this.timeStamp, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 18,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '${user.firstName??''} ${user.lastName??''}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            timeStamp,
            style: const TextStyle(
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
