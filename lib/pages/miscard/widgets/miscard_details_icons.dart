import 'package:flutter/material.dart';
import 'package:project_sym/models/miscard.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_details_footer_icons.dart';

class MisCardDetailsIcons extends StatelessWidget {
  final MisCard miscard;
  final int? commentsCount;
  const MisCardDetailsIcons({Key? key, required this.miscard, this.commentsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 0.0,
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: MisCardDetailsFooterIcons(
            miscard: miscard,
            commentsCount: commentsCount,
          ),
        ),
        const Divider(
          height: 0.0,
        ),
      ],
    );
  }
}
