import 'package:flutter/material.dart';
import 'package:project_sym/components/miscard.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Miscard(),
            Miscard(),
            Miscard(),
            Miscard(),
            Miscard(),
            Miscard(),
          ],
        ),
      ),
    );
  }
}
