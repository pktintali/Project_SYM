import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.air_sharp),
      title: const Text(
        'Project SYM',
        style: TextStyle(fontSize: 17),
      ),
      actions: const [
        Icon(Icons.search),
        SizedBox(width: 4),
        Icon(Icons.notifications),
        SizedBox(width: 4),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.square(45);
}
