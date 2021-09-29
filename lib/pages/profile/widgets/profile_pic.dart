import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mdq = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(100),
        image: const DecorationImage(
          image: NetworkImage(
            Constants.profilePic,
          ),
        ),
      ),
      child: SizedBox(
        height: 80+_mdq.width/25,
        width: 80+_mdq.width/25,
      ),
    );
  }
}
