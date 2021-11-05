import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/constants.dart';

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top:5,left:5,right:5),
      child: Text(Constants.about),
    );
  }
}
