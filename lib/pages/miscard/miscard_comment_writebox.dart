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
        SizedBox(
          width: 230,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Add a public comment...',
              filled: true,
              contentPadding:const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
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
