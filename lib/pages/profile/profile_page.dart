import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/widgets/profile_about.dart';
import 'package:project_sym/pages/profile/widgets/profile_achievments.dart';
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
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  const ProfileHeader(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const ProfileFollowers(),
                            Column(
                              children: const [
                                SizedBox(height: 40),
                                ProfileName(),
                                ProfileID(),
                              ],
                            ),
                            const ProfileFollowings(),
                          ],
                        ),
                        const ProfileAbout(),
                        const ProfileAchievments(),
                        const Divider(
                          color: Colors.green,
                        ),
                        const Text('Shared Miscards'),
                        const Divider(
                          color: Colors.green,
                        ),
                        // const MisCardWidget(),
                        // const MisCardWidget(),
                        // const MisCardWidget(),
                        // const MisCardWidget(),
                        // const MisCardWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 65),
                child: Center(
                  child: ProfilePic(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
