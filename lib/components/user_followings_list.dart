import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controllers/api/followings_list_controller.dart';
import '../models/user.dart';
import 'miscard_user_header.dart';

class UserFollowersList extends StatelessWidget {
  final int userID;
  UserFollowersList({Key? key, required this.userID}) : super(key: key);
  final flc = Get.put(FollowingListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
      ),
      body: GetBuilder<FollowingListController>(
        initState: (v) {
          flc.pagingController.addPageRequestListener((pageKey) {
            flc.getFollowings(pageKey: pageKey, userID: userID);
          });
        },
        builder: (_) {
          if (flc.pagingController.isBlank == true) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          return PagedListView<int, User>(
            pagingController: flc.pagingController,
            builderDelegate: PagedChildBuilderDelegate<User>(
              itemBuilder: (context, user, index) => Card(
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MisCardUserHeader(user: user),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
