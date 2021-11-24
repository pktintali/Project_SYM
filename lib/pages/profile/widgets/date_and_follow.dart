import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/api/profile_page_controller.dart';
import 'package:project_sym/pages/profile/edit_profile.dart';

class DateAndFollow extends StatelessWidget {
  final String dateJoined;
  final int userID;
  final bool isCurUser;
  DateAndFollow(
      {Key? key,
      required this.dateJoined,
      required this.userID,
      required this.isCurUser})
      : super(key: key);

  final ProfilePageController _ppc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text('Date Joined:'),
        ),
        const SizedBox(width: 8),
        Text(
          dateJoined.substring(0, 10),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  isCurUser || _ppc.isFollowing ? Colors.white : Colors.green),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            child: Text(
              isCurUser
                  ? 'Edit Profile'
                  : _ppc.isFollowing
                      ? 'Following'
                      : 'Follow',
              style: TextStyle(
                color:
                    isCurUser || _ppc.isFollowing ? Colors.black : Colors.white,
              ),
            ),
            onPressed: () async {
              if (isCurUser) {
                Get.to(() => const EditProfile());
              } else {
                if (!_ppc.isFollowing) {
                  await _ppc.handleFollowButton(userID);
                } else {
                  await _ppc.handleUnfollow(userID);
                }
              }
            },
          ),
        )
      ],
    );
  }
}
