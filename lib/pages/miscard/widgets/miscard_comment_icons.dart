import 'package:flutter/material.dart';

class MisCardCommentIcons extends StatelessWidget {
  const MisCardCommentIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Row(
            children: const [
              Icon(
                Icons.thumb_up_alt_outlined,
                size: 16,
                color: Colors.black54,
              ),
              SizedBox(width: 4),
              Text(
                '190',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 10,),
          const Icon(
            Icons.thumb_down_alt_outlined,
            size: 16,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
