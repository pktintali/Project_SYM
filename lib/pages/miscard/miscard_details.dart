import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/widgets/miscard_title.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/controllers/api/miscard_detail_controller.dart';
import 'package:project_sym/controllers/flipcard_details_controller.dart';
import 'package:project_sym/models/comment.dart';
import 'package:project_sym/models/miscard.dart';
import 'package:project_sym/pages/miscard/miscard_comment.dart';
import 'package:project_sym/pages/miscard/miscard_comment_writebox.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_back.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_footer.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_icons.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_front.dart';

class MisCardDetails extends StatelessWidget {
  final MisCard miscard;
  const MisCardDetails({Key? key, required this.miscard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FlipCardDetailsController());
    final fdController = Get.put(MisCardDetailController());
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Miscard'),
      ),
      bottomSheet: SizedBox(
        height: 49,
        child: GetBuilder<MisCardDetailController>(
          builder: (_) {
            return MisCardDetailsIcons(
              miscard: miscard,
              commentsCount: fdController.totalComments,
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MisCardUserHeader(
                    timeStamp: miscard.timestamp, user: miscard.user),
                MisCardTitle(title: miscard.title),
                FlipCard(
                  onFlip: () async {
                    await Future.delayed(const Duration(milliseconds: 400))
                        .then((value) => controller.updateFront());
                  },
                  controller: controller.fController,
                  front: MisCardFront(
                    mistake: miscard.mistake,
                  ),
                  back: MisCardBack(
                    lesson: miscard.lesson,
                  ),
                ),
                MisCardDetailsFooter(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Comments'),
                ),
                if (miscard.commentAllowed ?? true)
                  FutureBuilder(
                    future: fdController.getComments(miscard.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        List<Comment> comments = fdController.comments;
                        List<Widget> mcc = [];
                        for (var comment in comments) {
                          mcc.add(MisCardcomment(comment: comment));
                        }
                        return Column(
                          children: [
                            const Divider(),
                            const MisCardCommentWriteBox(),
                            const Divider(),
                            Column(
                              children: mcc,
                            ),
                            const SizedBox(height: 70),
                          ],
                        );
                      }
                      return const LinearProgressIndicator();
                    },
                  ),
                if (!(miscard.commentAllowed ?? true))
                  const Text(
                    'Creator turned off the comments',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
