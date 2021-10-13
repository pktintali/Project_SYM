import 'package:flutter/material.dart';

class MisCardCommentWriteBox extends StatelessWidget {
  const MisCardCommentWriteBox({Key? key}) : super(key: key);

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
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.send,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
