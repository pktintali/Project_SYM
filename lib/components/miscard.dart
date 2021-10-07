import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/components/widgets/miscard_footer.dart';
import 'package:project_sym/components/widgets/miscard_text.dart';
import 'package:project_sym/components/widgets/miscard_title.dart';
import 'package:project_sym/components/widgets/miscard_user_header.dart';
import 'package:project_sym/pages/miscard/miscard_details.dart';

class Miscard extends StatelessWidget {
  const Miscard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.deepPurple[100],
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.to(
                () => const MisCardDetails(),
                transition: Transition.zoom, 
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                MisCardUserHeader(),
                MisCardTitle(),
                MisCardText(),
              ],
            ),
          ),
          const MisCardFooter(),
        ],
      ),
    );
  }
}
