import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project_sym/components/miscard_user_header.dart';
import 'package:project_sym/controllers/api/miscard_likes_controller.dart';
import 'package:project_sym/models/user.dart';

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
        initState: (v) {
          alc.pagingController.addPageRequestListener(
            (pageKey) {
              alc.getMisCardLikes(pageKey, miscardID: miscardID);
            },
          );
        },
        builder: (_) {
          if (alc.pagingController.isBlank == true) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          return PagedListView<int, User>(
            pagingController: alc.pagingController,
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
