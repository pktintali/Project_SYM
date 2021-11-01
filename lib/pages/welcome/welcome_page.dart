import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:project_sym/pages/auth/login_page.dart';
import 'package:project_sym/pages/auth/signup_page.dart';
import 'package:project_sym/pages/tab/tab_page.dart';
import 'package:project_sym/pages/welcome/welcome_base.dart';

class WelcomePage extends Welcome {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget getWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: const Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => SignupPage());
              },
              child: const Text('New User🤨 ? SignUp'),
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
    );
  }
}
