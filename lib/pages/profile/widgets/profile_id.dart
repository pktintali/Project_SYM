import 'package:flutter/material.dart';

class ProfileID extends StatelessWidget {
  final String userName;
  const ProfileID({Key? key,required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '@$userName',
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}
