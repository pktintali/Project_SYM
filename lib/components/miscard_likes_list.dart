import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_user_header.dart';
import 'package:project_sym/controllers/api/miscard_likes_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MisCardLikesList extends StatelessWidget {
  final int miscardID;
  MisCardLikesList({Key? key, required this.miscardID}) : super(key: key);
  final alc = Get.put(MisCardLikesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likes'),
      ),
      body: GetBuilder<MisCardLikesController>(
        initState: (v) async {
          await alc.getMisCardLikes(miscardID);
        },
        builder: (_) {
          if (alc.likedUsers.isEmpty) {
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
            controller: alc.refreshController,
            onRefresh: () async {
              await alc.onRefresh(miscardID);
            },
            onLoading: () async {
              await alc.onLoading(miscardID);
            },
            child: ListView.builder(
              itemCount: alc.likedUsers.length,
              itemBuilder: (c, i) {
                return Card(child: TextButton(
                  onPressed: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MisCardUserHeader(user: alc.likedUsers[i]),
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
