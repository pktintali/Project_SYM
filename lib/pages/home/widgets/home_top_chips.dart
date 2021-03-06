import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/api/miscard_controller.dart';

class HomeTopChips extends StatelessWidget {
  HomeTopChips({Key? key}) : super(key: key);
  final MisCardController mc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[100],
      height: 35,
      width: MediaQuery.of(context).size.width - 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mc.allTopics.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: ActionChip(
              backgroundColor:
                  mc.selectedTopicIndex == index ? Colors.grey : Colors.white,
              label: Text(mc.allTopics[index][0].toUpperCase() +
                  mc.allTopics[index].substring(1)),
              onPressed: () async {
                if (mc.selectedTopicIndex == index) {
                  mc.setTopicMode(false);
                  // await mc.getMisCards(mc.pagingController.firstPageKey);
                } else {
                  mc.setTopicMode(true);
                  await mc.getTopicMisCards(
                      topic: mc.allTopics[index], i: index);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
