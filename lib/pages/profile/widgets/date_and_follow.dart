import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/pages/profile/edit_profile.dart';

class DateAndFollow extends StatelessWidget {
  final String dateJoined;
  final int userID;
  final bool isCurUser;
  const DateAndFollow(
      {Key? key,
      required this.dateJoined,
      required this.userID,
      required this.isCurUser})
      : super(key: key);

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
          child: ButtonTheme(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    isCurUser ? Colors.white : Colors.green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              child: Text(
                isCurUser ? 'Edit Profile' : 'Follow',
                style: TextStyle(
                  color: isCurUser ? Colors.black : Colors.white,
                ),
              ),
              onPressed: () {
                if(isCurUser){
                  Get.to(() => const EditProfile());
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
