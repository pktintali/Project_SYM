import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/widgets/miscard_title.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/controllers/api/miscard_detail_controller.dart';
import 'package:project_sym/controllers/flipcard_details_controller.dart';
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
      // appBar: AppBar(
      //   title: const Text('Miscard'),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton.small(
          backgroundColor: Colors.green,
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 22,
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 49,
        child: GetBuilder<MisCardDetailController>(
          initState: (v) async {
            await fdController.isLiked(miscard.id);
          },
          builder: (_) {
            if (!fdController.checkedForStatus) {
              return LinearProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.green.shade200,
              );
            }
            return MisCardDetailsIcons(
              miscard: miscard,
              commentsCount: fdController.totalComments,
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MisCardUserHeader(
                  timeStamp: miscard.timestamp, user: miscard.user),
              const Divider(height: 5),
              MisCardTitle(
                title: miscard.title,
                fromDetails: true,
              ),
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
              const Divider(),
              if (!(miscard.commentAllowed ?? true))
                const Text(
                  'Creator turned off the comments',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              if (miscard.commentAllowed ?? true)
                Expanded(
                  child: GetBuilder<MisCardDetailController>(
                    initState: (v) async {
                      await fdController.getComments(id: miscard.id);
                    },
                    builder: (_) {
                      //TODO This Might Cause BUG
                      if (fdController.listeners == 1) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: fdController.comments.length + 2,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                MisCardCommentWriteBox(
                                  miscardID: miscard.id,
                                ),
                                const Divider(),
                              ],
                            );
                          }
                          if (index == fdController.comments.length + 1) {
                            if ((fdController.nextPage) ||
                                (fdController.prevPage)) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.start,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepOrange),
                                      ),
                                      child: const Text('Prev'),
                                      onPressed: fdController.prevPage
                                          ? () async {
                                              await fdController
                                                  .getPrevPageComment(
                                                      cardID: miscard.id);
                                            }
                                          : null,
                                    ),
                                    if (fdController.nextPage)
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green[800]),
                                        ),
                                        child: const Text('Next'),
                                        onPressed: () async {
                                          await fdController.getNextPageComment(
                                              cardID: miscard.id);
                                        },
                                      ),
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                          return MisCardcomment(
                              comment: fdController.comments[index - 1]);
                        },
                      );
                    },
                  ),
                ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
