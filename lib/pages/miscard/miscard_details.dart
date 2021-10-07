import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:project_sym/components/widgets/miscard_title.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/pages/miscard/miscard_comment.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_back.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_footer.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_icons.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_front.dart';

class MisCardDetails extends StatelessWidget {
  const MisCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Miscard'),
      ),
      bottomSheet: const SizedBox(
        height: 68,
        child: FractionalTranslation(
          translation: Offset(0, 0.1),
          child: MisCardDetailsIcons(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MisCardUserHeader(),
                MisCardTitle(),
                FlipCard(
                  front: MisCardFront(),
                  back: MisCardBack(),
                ),
                MisCardDetailsFooter(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Comments'),
                ),
                Divider(),
                MisCardcomment(),
                MisCardcomment(),
                MisCardcomment(),
                MisCardcomment(),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
