import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';
import 'package:project_sym/controllers/api/profile_page_controller.dart';
import 'package:project_sym/controllers/tab_controller.dart';
import 'package:project_sym/pages/library/drafts_miscard.dart';
import 'package:project_sym/pages/library/liked_miscard.dart';
import 'package:project_sym/pages/library/saved_miscard.dart';
import 'package:project_sym/pages/welcome/welcome_page.dart';

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
                Get.to(() => const DraftMisCard());
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
