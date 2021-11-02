import 'package:flutter/material.dart';
import 'package:project_sym/models/user.dart';

class MisCardUserHeader extends StatelessWidget {
  final String timeStamp;
  final User user;
  const MisCardUserHeader(
      {Key? key, required this.timeStamp, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 15,
            child: user.firstName == null
                ? const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 22,
                  )
                : Text(
                    user.firstName!.isNotEmpty?user.firstName![0]:'',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '${user.firstName ?? ''} ${user.lastName ?? ''}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            timeStamp,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          )
        ],
      ),
    );
  }
}
