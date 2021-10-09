import 'package:flutter/material.dart';
import 'package:project_sym/components/widgets/miscard_footer.dart';

class MisCardDetailsIcons extends StatelessWidget {
  const MisCardDetailsIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(
          height: 0.0,
        ),
        Padding(
          padding: EdgeInsets.all(6.0),
          child: MisCardFooter(fromDetail: true,),
        ),
        Divider(
          height: 0.0,
        ),
      ],
    );
  }
}
