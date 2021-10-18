import 'package:flutter/material.dart';
import 'package:project_sym/pages/miscard/constants.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_comment_icons.dart';

class MisCardcomment extends StatelessWidget {
  const MisCardcomment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.greenAccent,
              radius: 17,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Text(
                      'Pradeep Kumar',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(' - '),
                    Text(
                      '2 minutes ago',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 55,
                  child: const Center(
                    child: Text(
                      Constants.fakeComment,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const MisCardCommentIcons(),
              ],
            ),
          ],
        ),
        const Divider(height: 8),
      ],
    );
  }
}
