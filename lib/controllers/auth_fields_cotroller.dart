import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';

class AuthFieldsController extends GetxController {
  String? _firstName;
  String? _lastName;
  String? _userName;
  String? _password;
  String? _password2;
  String? _email;
  bool _uNameAvailable = true;
  int? _reqTime;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get userName => _userName;
  String? get password => _password;
  String? get password2 => _password2;
  String? get email => _email;

  bool get userNameAvailable => _uNameAvailable;

  void updateFirstName({required String fName}) {
    _firstName = fName;
  }

  void updateLastName({required String lName}) {
    _lastName = lName;
  }

  void updateUserName({required String uName}) {
    _userName = uName;
  }

  void updatePassword({required String uPassword}) {
    _password = uPassword;
  }

  void updatePassword2({required String uPassword2}) {
    _password2 = uPassword2;
  }

  void updateUserEmail({required String uEmail}) {
    _email = uEmail;
  }

  Future<void> checkUserNameAvailability() async {
    int ct = DateTime.now().millisecond;
    _reqTime ??= ct + 201 ;
    if ((ct - _reqTime!).abs() > 200) {
      _reqTime = DateTime.now().second;
      var url = Uri.parse('${BaseRoute.domain}/api/users/');

      try {
        http.Response response = await http.get(url);
        // print(response.body);
        var data = json.decode(response.body);
        // print(data);
         _uNameAvailable = true;
        data.forEach((element) {
          String uname = element['username'];
          if (_userName == uname) {
            print('Set False');
            _uNameAvailable = false;
          }
        });
        update();
      } catch (e) {
        print("error checking availability");
        print(e);
      }

      print('API Calling');
    }
  }
}
