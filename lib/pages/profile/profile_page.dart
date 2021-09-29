import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/widgets/profile_about.dart';
import 'package:project_sym/pages/profile/widgets/profile_followers.dart';
import 'package:project_sym/pages/profile/widgets/profile_following.dart';
import 'package:project_sym/pages/profile/widgets/profile_header.dart';
import 'package:project_sym/pages/profile/widgets/profile_id.dart';
import 'package:project_sym/pages/profile/widgets/profile_name.dart';
import 'package:project_sym/pages/profile/widgets/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeader(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FractionalTranslation(
              translation: const Offset(0, -0.25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const ProfileFollowers(),
                      Column(
                        children: const [
                          ProfilePic(),
                          ProfileName(),
                          ProfileID(),
                        ],
                      ),
                      const ProfileFollowings(),
                    ],
                  ),
                  const ProfileAbout(),
                  const Divider()
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
