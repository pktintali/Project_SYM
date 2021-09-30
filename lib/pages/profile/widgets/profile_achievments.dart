import 'package:flutter/material.dart';

class ProfileAchievments extends StatelessWidget {
  const ProfileAchievments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Chip(
            backgroundColor: Colors.yellow,
            label: Text('Founder'),
            avatar: Icon(Icons.military_tech_outlined),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Chip(
            backgroundColor: Colors.lightBlueAccent,
            label: Text('Achiever'),
            avatar: Icon(Icons.star),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(4.0),
          child: Chip(
            backgroundColor: Colors.lightGreenAccent,
            label: Text('Helper'),
            avatar: Icon(Icons.ac_unit),
          ),
        ),
      ],
    );
  }
}
