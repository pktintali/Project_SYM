import 'package:flutter/material.dart';

class CornerDecoratedBox extends StatelessWidget {
  final BorderRadiusGeometry? radius;
  const CornerDecoratedBox({Key? key, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: radius),
      child: const SizedBox(
        height: 80,
        width: 80,
      ),
    );
  }
}
