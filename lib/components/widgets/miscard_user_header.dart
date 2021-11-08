import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/models/user.dart';
import 'package:project_sym/pages/profile/profile_view.dart';
import 'package:project_sym/pages/profile/widgets/profile_pic.dart';

class MisCardUserHeader extends StatelessWidget {
  final String? timeStamp;
  final User user;
  const MisCardUserHeader({Key? key, this.timeStamp, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String humanTime;
    if (timeStamp != null) {
      humanTime = timeStamp!.replaceAll(RegExp(r'Â'), '');
    } else {
      humanTime = '';
    }
    print(user.profilePic);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.to(() => ProfileView(userID: user.id));
            },
            child: Row(
              children: [
                user.profilePic == ''
                    ? CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 15,
                        child: user.firstName == null
                            ? const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 22,
                              )
                            : Text(
                                user.firstName!.isNotEmpty
                                    ? user.firstName![0]
                                    : '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      )
                    : CircleAvatar(
                        radius: 15,
                        child: ProfilePic(picURL: user.profilePic ?? ''),
                      ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${user.firstName ?? ''} ${user.lastName ?? ''}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                user.verified
                    ? Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.green[800],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          const Spacer(),
          Text(
            humanTime,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
          )
        ],
      ),
    );
  }
}
