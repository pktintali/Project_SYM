import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../components/miscard_widget.dart';
import '../../controllers/api/miscard_controller.dart';
import '../../controllers/api/profile_page_controller.dart';
import '../../models/miscard.dart';
import 'widgets/home_top_chips.dart';
import 'widgets/sliver_custom_header_delegate.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(MisCardController());
  final profileController = Get.put(ProfilePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MisCardController>(
        initState: (v) async {
          if (!controller.topicMode) {
            controller.pagingController.addPageRequestListener(
              (pageKey) {
                controller.getMisCards(pageKey);
              },
            );
          }
          if (profileController.currentUser == null) {
            await profileController.getUser();
          }
        },
        builder: (_) {
          if (!controller.topicMode &&
              controller.pagingController.isBlank == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.topicMode &&
              controller.topicPagingController.isBlank == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
              // SliverPersistentHeader(
              //   pinned: false,
              //   floating: true,
              //   delegate: SliverCustomHeaderDelegate(
              //     minHeight: 50,
              //     maxHeight: 50,
              //     child: const HomeTopBar(),
              //   ),
              // ),
              SliverPersistentHeader(
                pinned: false,
                floating: true,
                delegate: SliverCustomHeaderDelegate(
                  maxHeight: 37,
                  minHeight: 37,
                  child: RefreshIndicator(
                    child: HomeTopChips(),
                    onRefresh: () async {
                      await controller.getMisCards(1);
                    },
                  ),
                ),
              ),
              SliverFillRemaining(
                child: PagedListView<int, MisCard>(
                  pagingController: controller.topicMode
                      ? controller.topicPagingController
                      : controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<MisCard>(
                    itemBuilder: (context, item, index) =>
                        MisCardWidget(miscard: item),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
