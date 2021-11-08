import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/profile_page.dart';

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
