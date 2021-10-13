import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/pages/library/drafts_miscard.dart';
import 'package:project_sym/pages/library/liked_miscard.dart';
import 'package:project_sym/pages/library/saved_miscard.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.thumb_up_sharp),
              onTap: () {
                Get.to(() => const LikedMisCard());
              },
              title: const Text('Liked Miscards'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bookmarks),
              onTap: () {
                Get.to(() => const SavedMisCard());
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
        ],
      ),
    );
  }
}
