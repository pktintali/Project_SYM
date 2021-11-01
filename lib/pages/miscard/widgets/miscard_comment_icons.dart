import 'package:flutter/material.dart';

class MisCardCommentIcons extends StatelessWidget {
  final int? likesCount;
  const MisCardCommentIcons({Key? key, this.likesCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$likesCount',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.thumb_down_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
