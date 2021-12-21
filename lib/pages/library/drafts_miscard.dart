import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/miscard_widget.dart';
import '../../controllers/api/miscard_controller.dart';

class DraftMisCard extends StatelessWidget {
  DraftMisCard({Key? key}) : super(key: key);
  final MisCardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Drafts'),
      ),
      body: SafeArea(
        child: GetBuilder<MisCardController>(
          initState: (v) async {
            await controller.getDraftMisCards();
          },
          builder: (_) {
            if (!(controller.reqDraftDone) &&
                controller.draftMiscards.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: controller.draftMiscards.length,
              itemBuilder: (context, index) {
                return MisCardWidget(
                  miscard: controller.draftMiscards[index],
                  fromDraft: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
