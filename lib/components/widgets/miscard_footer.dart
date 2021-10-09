import 'package:flutter/material.dart';

class MisCardFooter extends StatelessWidget {
  final bool fromDetail;
  const MisCardFooter({this.fromDetail = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double iconSize = fromDetail ? 20 : 16;
    final double fontSize = fromDetail ? 16 : 13;
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
                    Icons.thumb_up_alt_outlined,
                    size: iconSize,
                    color: Colors.black54,
                  ),
                ),
              ),
              // const SizedBox(width: 4),
              Text(
                '190',
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
                '80',
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
