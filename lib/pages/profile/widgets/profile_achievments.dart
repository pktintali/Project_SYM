import 'package:flutter/material.dart';
import 'package:project_sym/pages/profile/widgets/achievment_chip.dart';

class ProfileAchievments extends StatelessWidget {
  const ProfileAchievments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        AchievmentChip(
          text: 'Admin',
          icon: Icons.military_tech_outlined,
          color: Colors.yellowAccent,
        ),
        AchievmentChip(
          text: 'Achiever',
          icon: Icons.star,
          color: Colors.lightGreenAccent,
        ),
        AchievmentChip(
          text: 'Helper',
          icon: Icons.ac_unit,
          color: Colors.white,
        ),
      ],
    );
  }
}
