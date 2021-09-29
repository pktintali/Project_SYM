import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      Constants.headerURL,
      fit: BoxFit.fitWidth,
      scale: 1 / 2,
    );
  }
}
