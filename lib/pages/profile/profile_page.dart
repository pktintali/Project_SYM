import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/miscard_widget.dart';
import '../../controllers/api/profile_page_controller.dart';
import '../../models/profile.dart';
import 'widgets/date_and_follow.dart';
import 'widgets/profile_about.dart';
import 'widgets/profile_achievments.dart';
import 'widgets/profile_followers.dart';
import 'widgets/profile_followings.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_id.dart';
import 'widgets/profile_link.dart';
import 'widgets/profile_name.dart';
import 'widgets/profile_pic.dart';

class ProfilePage extends StatelessWidget {
  final int? userID;
  const ProfilePage({Key? key, this.userID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    final ProfilePageController _controller = Get.find();

    return SafeArea(
      child: SingleChildScrollView(
        child: GetBuilder<ProfilePageController>(
          initState: (v) async {
            // if (_controller.user == null) {
            await _controller.getUser(userID: userID);
            // }
            // if (_controller.profileMisCards.isEmpty) {
            await _controller.getProfileMisCards(userID: userID);
            // }
          },
          builder: (_) {
            if (_controller.profile == null || _controller.userLoading) {
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
            if (_controller.user!.firstName != '') {
              fullName =
                  '${_controller.user!.firstName} ${_controller.user!.lastName}';
            } else {
              fullName = _controller.user!.userName;
            }
            Profile profile = _controller.profile!;
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
                      children: [
                        const ProfileFollowings(),
                        ProfileFollowers(
                          followersCount: _controller.noOfFollowers,
                          userID: _controller.user!.id,
                        ),
                      ],
                    ),
                    ProfileName(
                      name: fullName,
                      isVerified: _controller.user!.verified,
                    ),
                    Center(
                      child: ProfileID(
                        userName: _controller.user!.userName,
                      ),
                    ),
                    DateAndFollow(
                      dateJoined: _controller.user!.dateJoined ?? '',
                      isCurUser:
                          _controller.user!.id == _controller.currentUser!.id,
                      userID: _controller.user!.id,
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
                        if (_controller.miscardLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          List<Widget> _miscards = [];
                          for (var miscard in _controller.profileMisCards) {
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
                      ProfilePic(picURL: _controller.user!.profilePic ?? ''),
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
