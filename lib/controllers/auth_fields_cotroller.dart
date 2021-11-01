import 'package:get/get.dart';

class AuthFieldsController extends GetxController {
  String? _userName;
  String? _password;
  String? _password2;
  String? _email;

  String? get userName => _userName;
  String? get password => _password;
  String? get password2 => _password2;
  String? get email => _email;

  void updateUserName({required String uName}) {
    _userName = uName;
    // update();
  }

  void updatePassword({required String uPassword}) {
    _password = uPassword;
    // update();
  }
  void updatePassword2({required String uPassword2}) {
    _password2 = uPassword2;
    // update();
  }

  void updateUserEmail({required String uEmail}) {
    _email = uEmail;
    // update();
  }
}
