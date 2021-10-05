import 'package:flutter/material.dart';

class MisCardTitle extends StatelessWidget {
  const MisCardTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'This is Title of Card',
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
         color: Colors.green,
      ),
    );
  }
}
