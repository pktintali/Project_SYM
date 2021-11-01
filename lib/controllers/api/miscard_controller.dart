import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardController extends GetxController {
  static final _tokenBox = GetStorage();
  List<MisCard> _miscards = [];
  List<MisCard> _trendingMiscards = [];
  List<MisCard> _likedMiscards = [];

  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  Future<bool> isLiked(int miscardID) async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/api/likes/?user_id=$currentUserID&miscard_id=$miscardID');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      // print(data);
      if (data['count'] == 1) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getMisCards() async {
    var url =
        Uri.parse('http://127.0.0.1:8000/api/miscards/?ordering=-created_at');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      data = data['results'] as List;
      // print(data);
      List<MisCard> temp = [];
      List elements = [];
      data.forEach((element) {
        elements.add(element);
      });
      Future<void> fillArray(List datas) async {
        for (var element in datas) {
          bool likedByUser = await isLiked(element['id']);
          MisCard mc = MisCard.fromMap(element, likedByUser: likedByUser);
          temp.add(mc);
        }
      }

      await fillArray(elements);
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
        'http://127.0.0.1:8000/api/miscards/?ordering=-likes_count,-created_at');

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
        'http://127.0.0.1:8000/api/likes/?ordering=-liked_at&user_id=$currentUserID');
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
