import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MisCardLikesController extends GetxController {
  static final _tokenBox = GetStorage();
  bool _hasNextPage = false;
  int _curPage = 1;
  List<User> _likedUsers = [];
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  List<User> get likedUsers => [..._likedUsers];
  var token = _tokenBox.read('token');

  Future<void> getMisCardLikes(int miscardID,
      {bool fromLoading = false}) async {
    print('Getting MisCard Liked');
    var url = Uri.parse(
        '${BaseRoute.domain}/miscards/$miscardID/likes/?page=$_curPage');

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
        User mc = User.fromMap(element['user']);
        temp.add(mc);
      });
      // print(temp);
      if (fromLoading) {
        _likedUsers.addAll(temp);
      } else {
        _likedUsers = temp;
      }
      refreshController.refreshCompleted();
      update();
    } catch (e) {
      print("e get MisCard Likes");
      refreshController.refreshFailed();
      print(e);
    }
  }

  Future<void> onRefresh(miscardID) async {
    await getMisCardLikes(miscardID);
  }

  Future<void> onLoading(miscardID) async {
    print('ONLoading');
    if (_hasNextPage) {
      ++_curPage;
      await getMisCardLikes(miscardID, fromLoading: true);
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }
}
