import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_sym/models/comment.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_comment_icons.dart';
import 'package:project_sym/pages/profile/widgets/profile_pic.dart';

class MisCardcomment extends StatelessWidget {
  final Comment comment;
  const MisCardcomment({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String humanTimeStamp = comment.timeStamp.replaceAll(RegExp(r'Â'), '');
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            comment.user.profilePic == ''
                ? CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 15,
                    child: comment.user.firstName == null
                        ? const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 22,
                          )
                        : Text(
                            comment.user.firstName![0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  )
                : CircleAvatar(
                    radius: 15,
                    child: ProfilePic(picURL: comment.user.profilePic ?? ""),
                  ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${comment.user.firstName} ${comment.user.lastName}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      comment.user.verified
                          ? Icon(
                              Icons.verified,
                              size: 13,
                              color: Colors.green[800],
                            )
                          : const SizedBox(),
                      const Spacer(),
                      Text(
                        humanTimeStamp,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 55,
                  child: Text(
                    comment.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.padauk(),
                    // textAlign: TextAlign.left,
                  ),
                ),
                MisCardCommentIcons(
                  likesCount: comment.likesCount,
                ),
              ],
            ),
          ],
        ),
        const Divider(height: 8),
      ],
    );
  }
}
