import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';
import 'package:project_sym/pages/home/widgets/home_top_chips.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(MisCardController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: controller.getMisCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView.builder(
              itemCount: controller.miscards.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: HomeTopChips(),
                  );
                }
                return MisCardWidget(
                  miscard: controller.miscards[index - 1],
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
