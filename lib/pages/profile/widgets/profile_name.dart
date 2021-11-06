import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  final String name;
  const ProfileName({Key? key,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 3),
          Icon(
            Icons.verified,
            size: 20,
            color: Colors.green[800],
          )
        ],
      ),
    );
  }
}
