import 'package:flutter/material.dart';
import 'package:project_sym/components/miscard.dart';

class LikedMisCard extends StatelessWidget {
  const LikedMisCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Miscards'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Miscard(),
              Miscard(),
              Miscard(),
              Miscard(),
            ],
          ),
        ),
      ),
    );
  }
}
