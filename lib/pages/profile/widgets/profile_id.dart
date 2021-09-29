import 'package:flutter/material.dart';

class ProfileID extends StatelessWidget {
  const ProfileID({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        '@pradeep_tintali',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}
