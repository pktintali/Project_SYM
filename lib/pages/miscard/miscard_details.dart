import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/widgets/miscard_title.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/controllers/flipcard_details_controller.dart';
import 'package:project_sym/pages/miscard/miscard_comment.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_back.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_footer.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_icons.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_front.dart';

class MisCardDetails extends StatelessWidget {
  const MisCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FlipCardDetailsController());
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        title: const Text('Miscard'),
      ),
      bottomSheet: const SizedBox(
        height: 49,
        child: MisCardDetailsIcons(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MisCardUserHeader(),
                const MisCardTitle(),
                FlipCard(
                  onFlip: () async{
                    await Future.delayed(const Duration(milliseconds: 400)).then((value) => controller.updateFront());  
                  },
                  controller: controller.fController,
                  front: const MisCardFront(),
                  back: const MisCardBack(),
                ),
                MisCardDetailsFooter(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Comments'),
                ),
                const Divider(),
                const MisCardcomment(),
                const MisCardcomment(),
                const MisCardcomment(),
                const MisCardcomment(),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
