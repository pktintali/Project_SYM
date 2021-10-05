import 'package:flutter/material.dart';

class MisCardText extends StatelessWidget {
  const MisCardText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.all(4.0),
      child: Text(
        'This is the short description of the mistake in the preview of miscard. Here user will be able to see first 100 words of a miscard.',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
