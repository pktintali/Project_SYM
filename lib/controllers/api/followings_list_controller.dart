import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/user.dart';
import 'base_route.dart';

class FollowingListController extends GetxController {
  static final _tokenBox = GetStorage();
  bool _hasNextPage = false;
  final PagingController<int, User> pagingController =
      PagingController(firstPageKey: 1);
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  Future<void> getFollowings({int pageKey = 1, int? userID}) async {
    print('Getting Followings List');
    var url = Uri.parse(
        '${BaseRoute.domain}/followings/?user_id=$userID&page=$pageKey');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      if (data['next'] != null) {
        _hasNextPage = true;
      }
      data = data['results'] as List;
      // print(data);
      List<User> temp = [];
      data.forEach((element) {
        User mc = User.fromMap(element['followed_by']);
        temp.add(mc);
      });
      if (_hasNextPage) {
        pagingController.appendPage(temp, pageKey + 1);
      } else {
        pagingController.appendLastPage(temp);
      }
      update();
    } catch (e) {
      print("e get Followings List");
      print(e);
    }
  }
}
