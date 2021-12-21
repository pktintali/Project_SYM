import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

import '../controllers/api/miscard_controller.dart';
import '../controllers/api/profile_page_controller.dart';
import '../models/miscard.dart';
import '../models/user.dart';
import '../pages/miscard/miscard_adding_page.dart';
import '../pages/profile/profile_view.dart';
import '../pages/profile/widgets/profile_pic.dart';

class MisCardUserHeader extends StatelessWidget {
  final String? timeStamp;
  final User user;
  final MisCard? miscard;
  MisCardUserHeader(
      {Key? key, this.timeStamp, required this.user, this.miscard})
      : super(key: key);

  final ProfilePageController pc = Get.find();
  final MisCardController mc = Get.find();
  @override
  Widget build(BuildContext context) {
    String humanTime;
    if (timeStamp != null) {
      humanTime = timeStamp!.replaceAll(RegExp(r'Â'), '');
    } else {
      humanTime = '';
    }
    // print(user.profilePic);
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
          ),
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.more_vert_outlined,
                size: 20,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              Get.defaultDialog(middleText: 'Select an Option', actions: [
                if (user.id == pc.currentUserID)
                  TextButton(
                    child: const Text('Delete'),
                    onPressed: () async {
                      await mc
                          .deleteMiscard(miscardID: miscard!.id)
                          .then((value) => Get.back());
                      await pc.getProfileMisCards();
                    },
                  ),
                user.id == pc.currentUserID
                    ? TextButton(
                        child: const Text('Edit'),
                        onPressed: () {
                          Get.to(
                            () => MisCardAddingPage(
                              miscard: miscard,
                              editMode: true,
                            ),
                          );
                        },
                      )
                    : TextButton(
                        child: const Text('Report'),
                        onPressed: () {},
                      ),
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ]);
            },
          )
        ],
      ),
    );
  }
}
