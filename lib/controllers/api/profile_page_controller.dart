import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/miscard.dart';
import 'package:project_sym/models/user.dart';

class ProfilePageController extends GetxController {
  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  bool _miscardLoading = true;
  User? _user;
  List<MisCard> _profileMisCards = [];

  bool get miscardLoading => _miscardLoading;
  User? get user => _user;
  List<MisCard> get profileMisCards => [..._profileMisCards];

  Future<void> getUser() async {
    var url = Uri.parse('${BaseRoute.domain}/api/currentuser/');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      print(data);
      _user = User.fromMap(data[0]);
      // print(temp);
      update();
    } catch (e) {
      print("e get User Profile");
      print(e);
    }
  }

  Future<void> getProfileMisCards() async {
    print('Getting Profile MisCards');
    var url = Uri.parse(
        '${BaseRoute.domain}/api/miscards/?ordering=-created_at&user_id=$currentUserID');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      data = data['results'] as List;
      // print(data);
      List<MisCard> temp = [];
      data.forEach((element) {
        MisCard mc = MisCard.fromMap(element);
        temp.add(mc);
      });
      _profileMisCards = temp;
      _miscardLoading = false;
      // print(temp);
      update();
    } catch (e) {
      print("e get profile Miscards");
      print(e);
    }
  }
}
