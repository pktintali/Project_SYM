import 'package:flutter/material.dart';

class SavedMisCard extends StatelessWidget {
  const SavedMisCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            
          },
          child: const Text('POST'),
        ),
      ),
    );
  }
}
