import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/api/miscard_controller.dart';
import '../../controllers/api/profile_page_controller.dart';
import '../../controllers/tab_controller.dart';
import '../welcome/welcome_page.dart';
import 'drafts_miscard.dart';
import 'liked_miscard.dart';
import 'saved_miscard.dart';

class LibraryPage extends StatelessWidget {
  LibraryPage({Key? key}) : super(key: key);
  final tokenBox = GetStorage();
  final MisCardController mc = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.thumb_up_sharp),
              onTap: () {
                Get.to(() => LikedMisCard());
              },
              title: const Text('Liked Miscards'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bookmarks),
              onTap: () {
                Get.to(() => SavedMisCard());
              },
              title: const Text('Saved Miscards'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.history),
              onTap: () {
                Get.to(() => DraftMisCard());
              },
              title: const Text('Drafts'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout),
              onTap: () async {
                await tokenBox.remove('token');
                await tokenBox.remove('userID');
                await Get.delete<MisCardController>();
                await Get.delete<MyTabController>();
                await Get.delete<ProfilePageController>();
                Get.off(() => const WelcomePage());
              },
              title: const Text('LogOut'),
            ),
          ),
        ],
      ),
    );
  }
}
