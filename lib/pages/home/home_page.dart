import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';
import 'package:project_sym/controllers/api/profile_page_controller.dart';
import 'package:project_sym/pages/home/widgets/home_top_chips.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(MisCardController());
  final profileController = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MisCardController>(
        initState: (v) async {
          await controller.getMisCards();
          if (profileController.currentUser == null) {
            await profileController.getUser();
          }
        },
        builder: (_) {
          if (controller.miscards.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
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
                  body = const Text("No more MisCards");
                }
                return SizedBox(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: controller.refreshController,
            onRefresh: () async {
              await controller.onRefresh();
            },
            onLoading: () async {
              await controller.onLoading();
            },
            child: ListView.builder(
              itemCount: controller.miscards.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: HomeTopChips(),
                  );
                }
                return MisCardWidget(
                  miscard: controller.miscards[index - 1],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
