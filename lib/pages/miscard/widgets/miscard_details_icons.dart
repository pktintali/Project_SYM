import 'package:flutter/material.dart';
import 'package:project_sym/components/widgets/miscard_footer.dart';

class MisCardDetailsIcons extends StatelessWidget {
  const MisCardDetailsIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(),
        MisCardFooter(),
        Divider(),
      ],
    );
  }
}
