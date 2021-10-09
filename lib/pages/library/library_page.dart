import 'package:flutter/material.dart';

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
              onTap: () {},
              title: const Text('Liked Miscards'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bookmarks),
              onTap: () {},
              title: const Text('Saved Miscards'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.history),
              onTap: () {},
              title: const Text('Drafts'),
            ),
          ),
        ],
      ),
    );
  }
}
