import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/profile_page_controller.dart';
import 'package:project_sym/models/profile.dart';
import 'package:project_sym/pages/profile/widgets/date_and_follow.dart';
import 'package:project_sym/pages/profile/widgets/profile_about.dart';
import 'package:project_sym/pages/profile/widgets/profile_achievments.dart';
import 'package:project_sym/pages/profile/widgets/profile_followers.dart';
import 'package:project_sym/pages/profile/widgets/profile_following.dart';
import 'package:project_sym/pages/profile/widgets/profile_header.dart';
import 'package:project_sym/pages/profile/widgets/profile_id.dart';
import 'package:project_sym/pages/profile/widgets/profile_link.dart';
import 'package:project_sym/pages/profile/widgets/profile_name.dart';
import 'package:project_sym/pages/profile/widgets/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  final int? userID;
  const ProfilePage({Key? key, this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    final ProfilePageController controller = Get.find();

    return SafeArea(
      child: SingleChildScrollView(
        child: GetBuilder<ProfilePageController>(
          initState: (v) async {
            // if (controller.user == null) {
            await controller.getUser(userID: userID);
            // }
            // if (controller.profileMisCards.isEmpty) {
            await controller.getProfileMisCards(userID: userID);
            // }
          },
          builder: (_) {
            if (controller.profile == null || controller.userLoading) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 50,
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            late String fullName;
            if (controller.user!.firstName != '') {
              fullName =
                  '${controller.user!.firstName} ${controller.user!.lastName}';
            } else {
              fullName = controller.user!.userName;
            }
            Profile profile = controller.profile!;
            bool isAnyAchievment = (profile.adminBadge ||
                profile.helperBadge ||
                profile.impactorBadge);

            return Stack(
              children: [
                Column(
                  children: [
                    ProfileHeader(
                      fromTab: userID != null ? false : true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ProfileFollowers(),
                        ProfileFollowings(),
                      ],
                    ),
                    ProfileName(
                      name: fullName,
                      isVerified: controller.user!.verified,
                    ),
                    Center(
                      child: ProfileID(
                        userName: controller.user!.userName,
                      ),
                    ),
                    DateAndFollow(
                      dateJoined: controller.user!.dateJoined ?? '',
                      isCurUser:
                          controller.user!.id == controller.currentUser!.id,
                      userID: controller.user!.id,
                    ),
                    if (profile.bioLink != null && profile.bioLink != '')
                      ProfileLink(bioLink: profile.bioLink),
                    if (profile.about != null)
                      ProfileAbout(about: profile.about),

                    if (isAnyAchievment)
                      const Center(
                        child: Text(
                          'Achievments',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    if (isAnyAchievment) ProfileAchievments(profile: profile),
                    const Divider(
                      color: Colors.green,
                      height: 10,
                    ),
                    const Text(
                      'Shared Miscards',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(
                      color: Colors.green,
                      height: 10,
                    ),
                    //Fill with MisCards
                    SimpleBuilder(
                      builder: (c) {
                        if (controller.miscardLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<Widget> _miscards = [];
                          for (var miscard in controller.profileMisCards) {
                            _miscards.add(MisCardWidget(miscard: miscard));
                          }
                          return Column(
                            children: _miscards,
                          );
                        }
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2 * mdq.width / 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfilePic(picURL: controller.user!.profilePic ?? ''),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
