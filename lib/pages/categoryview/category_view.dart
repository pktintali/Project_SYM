import 'package:flutter/material.dart';
import 'package:project_sym/components/miscard_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              // MisCardWidget(),
              // MisCardWidget(),
              // MisCardWidget(),
              // MisCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
