import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';

class LikedMisCard extends StatelessWidget {
  LikedMisCard({Key? key}) : super(key: key);
  final controller = Get.put(MisCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Miscards'),
      ),
      body: SafeArea(
        child: FutureBuilder(
        future: controller.getLikedMisCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: controller.likedMiscards.length,
              itemBuilder: (context, index) {
                return MisCardWidget(
                  miscard: controller.likedMiscards[index],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      ),
    );
  }
}
