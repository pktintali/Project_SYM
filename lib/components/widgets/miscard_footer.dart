import 'package:flutter/material.dart';

class MisCardFooter extends StatelessWidget {
  const MisCardFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.thumb_up_alt_outlined,
                size: 20,
                color: Colors.black54,
              ),
              SizedBox(width: 4),
              Text(
                '190',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Icon(
            Icons.thumb_down_alt_outlined,
            size: 20,
            color: Colors.black54,
          ),
          Row(
            children: const [
              Icon(
                Icons.comment,
                size: 20,
                color: Colors.black54,
              ),
              SizedBox(width: 4),
              Text(
                '80',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const Icon(
            Icons.share,
            size: 20,
            color: Colors.black54,
          ),
          const Icon(
            Icons.bookmark_add_outlined,
            size: 20,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
