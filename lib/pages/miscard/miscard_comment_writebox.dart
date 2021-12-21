import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/api/miscard_detail_controller.dart';
import '../profile/widgets/profile_pic.dart';

class MisCardCommentWriteBox extends StatelessWidget {
  final int miscardID;
  final String curUserPic;
  MisCardCommentWriteBox(
      {Key? key, required this.miscardID, required this.curUserPic})
      : super(key: key);
  final MisCardDetailController mdc = Get.find();

  @override
  Widget build(BuildContext context) {
    print(curUserPic);
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.greenAccent,
          radius: 17,
          child: curUserPic == ''
              ? const Icon(
                  Icons.person,
                  color: Colors.black,
                )
              : ProfilePic(picURL: curUserPic),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: TextField(
            controller: mdc.commentBoxTextController,
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Add a public comment...',
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (v) {
              mdc.commentBoxText = v;
            },
          ),
        ),
        IconButton(
          onPressed: () {
            if (mdc.commentBoxText != '') {
              mdc.writeComment(miscardID: miscardID);
            }
          },
          icon: const Icon(
            Icons.send,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
