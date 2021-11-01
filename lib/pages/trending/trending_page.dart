import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';

class TrendingPage extends StatelessWidget {
  TrendingPage({Key? key}) : super(key: key);
  final controller = Get.put(MisCardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: controller.getTrendingMisCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: controller.trendingMiscards.length,
              itemBuilder: (context, index) {
                return MisCardWidget(
                  miscard: controller.trendingMiscards[index],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
