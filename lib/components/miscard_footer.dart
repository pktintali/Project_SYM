import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../models/miscard.dart';

class MisCardFooter extends StatelessWidget {
  final MisCard miscard;
  final int? commentsCount;
  const MisCardFooter({Key? key, required this.miscard, this.commentsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Icon(
                  Icons.thumb_up_alt_rounded,
                  size: 16,
                  // color: Colors.black54,
                  color: Colors.grey.shade400,
                ),
              ),
              // const SizedBox(width: 4),
              Text(
                '${miscard.likesCount ?? ''} Likes',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Share.share(
                'Mistake: ${miscard.mistake}\nLesson: ${miscard.lesson}',
                subject: 'Have a look at this MisCard',
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(
                Icons.share,
                size: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
