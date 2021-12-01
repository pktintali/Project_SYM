import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FollowingListController extends GetxController {
  static final _tokenBox = GetStorage();
  bool _hasNextPage = false;
  int _curPage = 1;
  List<User> _followingsUsers = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  List<User> get followedUsers => [..._followingsUsers];
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  Future<void> getFollowings({int? userID, bool fromLoading = false}) async {
    print('Getting Followings List');
    var url = Uri.parse(
        '${BaseRoute.domain}/followings/?user_id=$userID&page=$_curPage');

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
      // print(temp);
      if (fromLoading) {
        _followingsUsers.addAll(temp);
      } else {
        _followingsUsers = temp;
      }
      refreshController.refreshCompleted();
      update();
    } catch (e) {
      print("e get Followings List");
      refreshController.refreshFailed();
      print(e);
    }
  }

  Future<void> onRefresh({int? userID}) async {
    await getFollowings(userID: userID);
  }

  Future<void> onLoading({int? userID}) async {
    print('ONLoading');
    if (_hasNextPage) {
      ++_curPage;
      await getFollowings(userID: userID, fromLoading: true);
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }
}
