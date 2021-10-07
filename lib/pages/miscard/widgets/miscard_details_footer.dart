import 'package:flutter/material.dart';

class MisCardDetailsFooter extends StatelessWidget {
  const MisCardDetailsFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.deepOrangeAccent[400]
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        onPressed: () {},
        child: const Text('Lesson'),
      ),
    );
  }
}
