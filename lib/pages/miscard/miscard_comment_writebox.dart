import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/api/miscard_detail_controller.dart';

class MisCardCommentWriteBox extends StatelessWidget {
  final int miscardID;
  MisCardCommentWriteBox({Key? key, required this.miscardID}) : super(key: key);
  final MisCardDetailController mdc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.greenAccent,
          radius: 17,
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
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
              }),
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
