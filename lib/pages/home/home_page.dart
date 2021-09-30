import 'package:flutter/material.dart';
import 'package:project_sym/components/miscard.dart';
import 'package:project_sym/pages/home/widgets/home_top_chips.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HomeTopChips(),
          Miscard(),
          Miscard(),
          Miscard(),
          Miscard(),
          Miscard(),
          Miscard(),
        ],
      ),
    );
  }
}
