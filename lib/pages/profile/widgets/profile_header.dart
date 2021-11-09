import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/pages/profile/constants.dart';
import 'package:project_sym/pages/profile/edit_profile.dart';

class ProfileHeader extends StatelessWidget {
  final bool fromTab;
  const ProfileHeader({
    Key? key,
    this.fromTab = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          Constants.headerURL,
          fit: BoxFit.fitWidth,
          scale: 1 / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            fromTab
                ? const SizedBox()
                : FloatingActionButton.small(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                    backgroundColor: Colors.green,
                  ),
            FloatingActionButton(
              mini: true,
              heroTag: 'menu',
              elevation: 0.5,
              backgroundColor: const Color(0xa0888888),
              onPressed: () {
                showMenu(
                  context: context,
                  position: const RelativeRect.fromLTRB(1, 0, 0, 0),
                  items: [
                    PopupMenuItem(
                      enabled: true,
                      child: const Text('LogOut'),
                      onTap: () {
                       
                      },
                    ),
                    const PopupMenuItem(
                      child: Text('Settings'),
                    ),
                  ],
                );
              },
              child: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
