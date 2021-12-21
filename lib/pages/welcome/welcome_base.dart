import 'package:flutter/material.dart';

import 'widgets/corner_decorated_box.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  Widget getWidget(BuildContext context){
    return const Center();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CornerDecoratedBox(
                      radius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    CornerDecoratedBox(
                      radius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CornerDecoratedBox(
                      radius: BorderRadius.only(
                        topRight: Radius.circular(100),
                      ),
                    ),
                    CornerDecoratedBox(
                      radius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            getWidget(context),
          ],
        ),
      ),
    );
  }
}
