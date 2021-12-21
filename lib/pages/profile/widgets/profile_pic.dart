import 'package:flutter/material.dart';

import '../../../controllers/api/base_route.dart';
import '../constants.dart';

class ProfilePic extends StatelessWidget {
  final String picURL;
  const ProfilePic({Key? key, required this.picURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mdq = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image: NetworkImage(
           picURL==''?Constants.profilePic:picURL.startsWith('http')?picURL:BaseRoute.domain+picURL
          ),
        ),
      ),
      child: SizedBox(
        height: 80 + _mdq.width / 25,
        width: 80 + _mdq.width / 25,
      ),
    );
  }
}
