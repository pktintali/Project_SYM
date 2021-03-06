import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'base_route.dart';

class AuthController extends GetxController {
  final tokenBox = GetStorage();

  Future<int> getUserID(String token) async {
    var url = Uri.parse('${BaseRoute.domain}/currentuser/');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      var id = data[0]['id'];
      return id;
    } catch (e) {
      print("Error getting currentUserID");
      print(e);
      return 0;
    }
  }

  Future<bool> loginNow(String? uname, String? passw) async {
    var url = Uri.parse('${BaseRoute.domain}/login/');
    try {
      http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({"username": uname, "password": passw}));
      var data = json.decode(response.body) as Map;

      if (data.containsKey("token")) {
        tokenBox.write("token", data['token']);
        print(tokenBox.read('token'));
        print('obtaining user id');
        int userID = await getUserID(tokenBox.read('token'));
        await tokenBox.write('userID', userID);
        print(tokenBox.read('userID'));
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }

  Future<bool> registernow({
    String? uname,
    String? passw,
    String? email,
    String? firstName,
    String? lastName,
  }) async {
    var url = Uri.parse('${BaseRoute.domain}/register/');
    try {
      http.Response response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode({
            "username": uname,
            "password": passw,
            "email": email,
            "first_name": firstName,
            "last_name": lastName,
          }));
      var data = json.decode(response.body) as Map;
      print(data);
      if (data["error"] == false) {
        return true;
      }
      return false;
    } catch (e) {
      print("e loginNow");
      print(e);
      return false;
    }
  }
}
