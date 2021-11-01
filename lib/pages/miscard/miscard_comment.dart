import 'package:flutter/material.dart';
import 'package:project_sym/models/comment.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_comment_icons.dart';

class MisCardcomment extends StatelessWidget {
  final Comment comment;
  const MisCardcomment({Key? key, required this.comment}) : super(key: key);

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
                  children:[
                    Text(
                      '${comment.user.firstName} ${comment.user.lastName}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Text(' - '),
                    Text(
                      comment.timeStamp,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Text(
                    comment.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.left,
                  ),
                ),
                MisCardCommentIcons(likesCount: comment.likesCount,),
              ],
            ),
          ],
        ),
        const Divider(height: 8),
      ],
    );
  }
}
