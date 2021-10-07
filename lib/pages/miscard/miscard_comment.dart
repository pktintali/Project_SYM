import 'package:flutter/material.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/pages/miscard/widgets/miscard_comment_icons.dart';

class MisCardcomment extends StatelessWidget {
  const MisCardcomment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MisCardUserHeader(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Text('Same happened with me last year'),
        ),
        MisCardCommentIcons(),
        Divider(),
      ],
    );
  }
}
