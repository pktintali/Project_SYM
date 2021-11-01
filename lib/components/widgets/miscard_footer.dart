import 'package:flutter/material.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardFooter extends StatelessWidget {
  final bool fromDetail;
  final MisCard miscard;
  final int? commentsCount;
  const MisCardFooter(
      {this.fromDetail = false, Key? key, required this.miscard, this.commentsCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconSize = fromDetail ? 20 : 16;
    final double fontSize = fromDetail ? 16 : 13;
    bool likedByUser = miscard.isLiked ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    likedByUser ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    size: iconSize,
                    // color: Colors.black54,
                    color: likedByUser ? Colors.green : Colors.black54,
                  ),
                ),
              ),
              // const SizedBox(width: 4),
              Text(
                '${miscard.likesCount ?? ''}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.thumb_down_alt_outlined,
                size: iconSize,
                color: Colors.black54,
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.comment,
                size: iconSize,
                color: Colors.black54,
              ),
              const SizedBox(width: 4),
              Text(
                fromDetail ? '$commentsCount' : '',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.share,
                size: iconSize,
                color: Colors.black54,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.bookmark_add_outlined,
                size: iconSize,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
