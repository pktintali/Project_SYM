import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/miscard_widget.dart';
import '../../controllers/api/miscard_controller.dart';

class LikedMisCard extends StatelessWidget {
  LikedMisCard({Key? key}) : super(key: key);
  final MisCardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Miscards'),
      ),
      body: SafeArea(
        child: GetBuilder<MisCardController>(
          initState: (v) async {
            await controller.getLikedMisCards();
          },
          builder: (_) {
            if (!(controller.reqLikeDone) && controller.likedMiscards.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: controller.likedMiscards.length,
              itemBuilder: (context, index) {
                return MisCardWidget(miscard: controller.likedMiscards[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
