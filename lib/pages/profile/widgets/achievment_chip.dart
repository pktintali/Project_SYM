import 'package:flutter/material.dart';

class AchievmentChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const AchievmentChip({Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ActionChip(
        onPressed: () {},
        elevation: 2,
        backgroundColor: color,
        labelPadding: const EdgeInsets.all(0),
        label: Text(text, style: const TextStyle(fontSize: 12)),
        avatar: Icon(
          icon,
          size: 18,
        ),
      ),
    );
  }
}
