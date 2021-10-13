import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Pradeep Kumar',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 3),
        Icon(
          Icons.verified,
          size: 20,
          color: Colors.green[800],
        )
      ],
    );
  }
}
