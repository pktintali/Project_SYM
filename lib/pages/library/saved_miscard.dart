import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';

class SavedMisCard extends StatelessWidget {
  SavedMisCard({Key? key}) : super(key: key);
  final MisCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved MisCards'),
      ),
      body: SafeArea(
        child: GetBuilder<MisCardController>(
          initState: (v) async {
            await controller.getSavedMisCards();
          },
          builder: (_) {
            if (!(controller.reqSavedDone) &&
                controller.savedMiscards.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: controller.savedMiscards.length,
              itemBuilder: (context, index) {
                return MisCardWidget(miscard: controller.savedMiscards[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
