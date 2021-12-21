import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../models/miscard.dart';
import '../pages/miscard/miscard_adding_page.dart';
import '../pages/miscard/miscard_details.dart';
import 'miscard_footer.dart';
import 'miscard_text.dart';
import 'miscard_title.dart';
import 'miscard_user_header.dart';

class MisCardWidget extends StatelessWidget {
  final MisCard miscard;
  final bool fromDraft;
  const MisCardWidget({Key? key, required this.miscard, this.fromDraft = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.deepPurple[100],
      child: TextButton(
        onPressed: () {
          if (fromDraft) {
            Get.to(() => MisCardAddingPage(miscard: miscard));
          } else {
            Get.to(
                () => MisCardDetails(
                      miscard: miscard,
                    ),
                transition: Transition.size,
                curve: Curves.easeInOutSine,
                duration: const Duration(milliseconds: 500));
          }
        },
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!fromDraft)
                  MisCardUserHeader(
                    user: miscard.user!,
                    timeStamp: miscard.timestamp,
                    miscard: miscard,
                  ),
                MisCardTitle(title: miscard.title ?? 'No Title'),
                MisCardText(description: miscard.mistake ?? ""),
              ],
            ),
            if (!fromDraft)
              MisCardFooter(
                miscard: miscard,
              ),
          ],
        ),
      ),
    );
  }
}
