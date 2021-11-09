import 'package:flutter/material.dart';
import 'package:project_sym/models/profile.dart';
import 'package:project_sym/pages/profile/widgets/achievment_chip.dart';

class ProfileAchievments extends StatelessWidget {
  final Profile profile;
  const ProfileAchievments({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        if(profile.adminBadge)
        const AchievmentChip(
          text: 'Admin',
          icon: Icons.military_tech_outlined,
          color: Colors.yellowAccent,
        ),
        if(profile.impactorBadge)
        const AchievmentChip(
          text: 'Achiever',
          icon: Icons.star,
          color: Colors.lightGreenAccent,
        ),
        if(profile.helperBadge)
        const AchievmentChip(
          text: 'Helper',
          icon: Icons.ac_unit,
          color: Colors.white,
        ),
      ],
    );
  }
}
