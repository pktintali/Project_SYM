import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardController extends GetxController {
  static final _tokenBox = GetStorage();
  List<MisCard> _miscards = [];
  List<MisCard> _trendingMiscards = [];
  List<MisCard> _likedMiscards = [];

  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  Future<bool> getMisCards() async {
    var url =
        Uri.parse('${BaseRoute.domain}/api/miscards/?ordering=-created_at');

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
      // print(temp);
      _miscards = temp;
      // update();
      return true;
    } catch (e) {
      print("e getMiscards");
      print(e);
      return false;
    }
  }

  Future<bool> getTrendingMisCards() async {
    var url = Uri.parse(
        '${BaseRoute.domain}/api/miscards/?ordering=-likes_count,-created_at');

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
      _trendingMiscards = temp;
      // update();
      return true;
    } catch (e) {
      print("e get trending miscards");
      print(e);
      return false;
    }
  }

  Future<bool> getLikedMisCards() async {
    print(currentUserID);
    var url = Uri.parse(
        '${BaseRoute.domain}/api/likes/?ordering=-liked_at&user_id=$currentUserID');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      data = data['results'] as List;
      // print(data);
      List<MisCard> temp = [];
      data.forEach((element) {
        MisCard mc = MisCard.fromMap(element['miscard']);
        temp.add(mc);
      });
      _likedMiscards = temp;
      // update();
      return true;
    } catch (e) {
      print("e get likes");
      print(e);
      return false;
    }
  }

  List<MisCard> get miscards {
    return [..._miscards];
  }

  List<MisCard> get trendingMiscards {
    return [..._trendingMiscards];
  }

  List<MisCard> get likedMiscards {
    return [..._likedMiscards];
  }
}
