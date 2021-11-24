import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MisCardTitle extends StatelessWidget {
  final bool fromDetails;
  final String title;
  const MisCardTitle({Key? key, required this.title, this.fromDetails = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: fromDetails ? 4 : 0),
      child: Text(title,
          style: GoogleFonts.esteban(fontSize: fromDetails ? 17 : 15,
            // fontWeight: FontWeight.w600,
            color: Colors.green,),
          ),
    );
  }
}
