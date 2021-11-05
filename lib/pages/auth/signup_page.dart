import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/api/auth_controller.dart';
import 'package:project_sym/controllers/auth_fields_cotroller.dart';
import 'package:project_sym/pages/auth/login_page.dart';
import 'package:project_sym/pages/welcome/welcome_base.dart';

class SignupPage extends Welcome {
  SignupPage({Key? key}) : super(key: key);
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
                  hintText: 'UserName...( without white space )',
                ),
                onChanged: (v) async {
                  controller.updateUserName(uName: v);
                  await controller.checkUserNameAvailability();
                },
              ),
            ),
            GetBuilder<AuthFieldsController>(
              builder: (_) {
                if (!controller.userNameAvailable) {
                  return const Text(
                    'Username is already taken',
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'FirstName',
                ),
                onChanged: (v) {
                  controller.updateFirstName(fName: v);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'LastName',
                ),
                onChanged: (v) {
                  controller.updateLastName(lName: v);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                ),
                obscureText: true,
                onChanged: (v) {
                  controller.updatePassword2(uPassword2: v);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                onChanged: (v) {
                  controller.updateUserEmail(uEmail: v);
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
                  child: const Text('Signup'),
                  onPressed: () {
                    _registerNow(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _registerNow(BuildContext context) async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState!.save();
    bool isregis = await authController.registernow(
      uname: controller.userName,
      passw: controller.password,
      email: controller.email,
      firstName: controller.firstName,
      lastName: controller.lastName,
    );
    if (isregis) {
      Get.to(() => LoginPage());
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Failed to Registerg. Try Again"),
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
