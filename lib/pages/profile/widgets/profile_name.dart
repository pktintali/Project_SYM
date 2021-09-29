import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Pradeep Kumar',
      style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
