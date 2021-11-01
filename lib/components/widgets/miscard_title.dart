import 'package:flutter/material.dart';

class MisCardTitle extends StatelessWidget {
  final String title;
  const MisCardTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.green,
      ),
    );
  }
}
