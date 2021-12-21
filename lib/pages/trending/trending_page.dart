import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/miscard_widget.dart';
import '../../controllers/api/miscard_controller.dart';

class TrendingPage extends StatelessWidget {
  TrendingPage({Key? key}) : super(key: key);
  final MisCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MisCardController>(
        initState: (v) async {
          await controller.getTrendingMisCards();
        },
        builder: (_) {
          if (controller.trendingMiscards.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: controller.trendingMiscards.length,
            itemBuilder: (context, index) {
              return MisCardWidget(
                miscard: controller.trendingMiscards[index],
              );
            },
          );
        },
      ),
    );
  }
}
