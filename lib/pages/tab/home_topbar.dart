import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_sym/pages/home/widgets/search_bar.dart';

class HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.air_sharp),
      title: Text(
        'Project SYM',
        style: GoogleFonts.heptaSlab(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Get.to(() => SearchBar());
          },
        ),
        // const SizedBox(width: 4),
        const Icon(Icons.notifications),
        const SizedBox(width: 4),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.square(45);
}
