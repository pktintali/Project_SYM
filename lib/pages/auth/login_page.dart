import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/api/auth_controller.dart';
import '../../controllers/auth_fields_cotroller.dart';
import '../tab/tab_page.dart';
import '../welcome/welcome_base.dart';

class LoginPage extends Welcome {
  LoginPage({Key? key}) : super(key: key);
  final controller = Get.put(AuthFieldsController());
  final authController = Get.put(AuthController());
  final _form = GlobalKey<FormState>();

  @override
  Widget getWidget(BuildContext context) {
    return Center(
      child: Form(
        key: _form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'UserName',
                ),
                onChanged: (v) {
                  controller.updateUserName(uName: v);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
                onChanged: (v) {
                  controller.updatePassword(uPassword: v);
                },
              ),
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  child: const Text('Back'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                ElevatedButton(
                  child: const Text('logIn'),
                  onPressed: () {
                    _loginNew(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _loginNew(BuildContext context) async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState!.save();
    bool istoken =
        await authController.loginNow(controller.userName, controller.password);
    if (istoken) {
      Get.to(() => TabPage());
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("LogIn Falied. Make Sure Your UserName and Password is Correct and Try Again"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              )
            ],
          );
        },
      );
    }
  }
}
