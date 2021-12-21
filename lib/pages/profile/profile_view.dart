import 'package:flutter/material.dart';

import 'profile_page.dart';

class ProfileView extends StatelessWidget {
  final int userID;
  const ProfileView({Key? key, required this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfilePage(
        userID: userID,
      ),
    );
  }
}
