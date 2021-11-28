import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_user_header.dart';
import 'package:project_sym/controllers/api/followings_list_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
        initState: (v) async {
          await flc.getFollowings(userID: userID);
        },
        builder: (_) {
          if (flc.followedUsers.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = const Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = const CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = const Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = const Text("release to load more");
                } else {
                  body = const Text("No more Data");
                }
                return SizedBox(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: flc.refreshController,
            onRefresh: () async {
              await flc.onRefresh(userID: userID);
            },
            onLoading: () async {
              await flc.onLoading(userID: userID);
            },
            child: ListView.builder(
              itemCount: flc.followedUsers.length,
              itemBuilder: (c, i) {
                return Card(
                    child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MisCardUserHeader(user: flc.followedUsers[i]),
                  ),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
