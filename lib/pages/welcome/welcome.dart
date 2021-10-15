import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/pages/tab/tab_page.dart';
import 'package:project_sym/pages/welcome/widgets/corner_decorated_box.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign In With Google'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign In With Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => TabPage());
                      },
                      child: const Text('Skip'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
