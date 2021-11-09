import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAbout extends StatelessWidget {
  final String? about;
  const ProfileAbout({Key? key, this.about}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 4),
      child: Text(
        about ?? '',
        style: GoogleFonts.padauk(),
      ),
    );
  }
}
