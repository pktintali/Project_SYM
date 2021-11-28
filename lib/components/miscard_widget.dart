import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/components/miscard_footer.dart';
import 'package:project_sym/components/miscard_text.dart';
import 'package:project_sym/components/miscard_title.dart';
import 'package:project_sym/components/miscard_user_header.dart';
import 'package:project_sym/models/miscard.dart';
import 'package:project_sym/pages/miscard/miscard_adding_page.dart';
import 'package:project_sym/pages/miscard/miscard_details.dart';

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
