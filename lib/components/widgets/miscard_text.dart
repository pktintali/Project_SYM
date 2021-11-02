import 'package:flutter/material.dart';

class MisCardText extends StatelessWidget {
  final String description;
  const MisCardText({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        description,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
