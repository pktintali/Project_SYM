import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/components/widgets/miscard_footer.dart';
import 'package:project_sym/components/widgets/miscard_text.dart';
import 'package:project_sym/components/widgets/miscard_title.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/models/miscard.dart';
import 'package:project_sym/pages/miscard/miscard_details.dart';

class MisCardWidget extends StatelessWidget {
  final MisCard miscard;
  const MisCardWidget({Key? key, required this.miscard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.deepPurple[100],
      child: TextButton(
        onPressed: () {
          Get.to(
            () => MisCardDetails(
              miscard: miscard,
            ),
            transition: Transition.zoom,
          );
        },
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MisCardUserHeader(
                    user: miscard.user, timeStamp: miscard.timestamp),
                MisCardTitle(title: miscard.title),
                MisCardText(description: miscard.mistake),
              ],
            ),
            MisCardFooter(
              miscard: miscard,
            ),
          ],
        ),
      ),
    );
  }
}
