import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardController extends GetxController {
  static final _tokenBox = GetStorage();
  bool _fromLike = false;
  bool _fromHome = false;
  bool _fromTrending = false;
  bool _fromSaved = false;
  bool _reqLikeDone = false;
  bool _reqSavedDone = false;
  bool _reqDraftDone = false;

  List<MisCard> _miscards = [];
  List<MisCard> _trendingMiscards = [];
  List<MisCard> _likedMiscards = [];
  List<MisCard> _savedMiscards = [];
  List<MisCard> _draftMisCards = [];

  bool get fromLike => _fromLike;
  bool get fromHome => _fromHome;
  bool get fromtrending => _fromTrending;
  bool get fromSaved => _fromSaved;
  bool get reqLikeDone => _reqLikeDone;
  bool get reqSavedDone => _reqSavedDone;
  bool get reqDraftDone => _reqDraftDone;

  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  List<MisCard> get miscards => [..._miscards];

  List<MisCard> get trendingMiscards => [..._trendingMiscards];

  List<MisCard> get likedMiscards => [..._likedMiscards];

  List<MisCard> get savedMiscards => [..._savedMiscards];

  List<MisCard> get draftMiscards => [..._draftMisCards];

  Future<void> getMisCards() async {
    print('Getting MisCards');
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
      update();
    } catch (e) {
      print("e getMiscards");
      print(e);
    }

    _fromLike = false;
    _fromHome = true;
    _fromSaved = false;
    _fromTrending = false;
  }

  Future<void> getTrendingMisCards() async {
    print('Getting Trending MisCards');
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
      update();
    } catch (e) {
      print("e get trending miscards");
      print(e);
    }
    _fromLike = false;
    _fromHome = false;
    _fromSaved = false;
    _fromTrending = true;
  }

  Future<void> getLikedMisCards() async {
    print('Getting Liked MisCard');
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
      update();
    } catch (e) {
      print("e get likes");
      print(e);
    }
    _fromLike = true;
    _fromHome = false;
    _fromSaved = false;
    _fromTrending = false;
    _reqLikeDone = true;
  }

  Future<void> getSavedMisCards() async {
    print('Getting Saved MisCard');
    var url = Uri.parse(
        '${BaseRoute.domain}/api/saved_miscards/?user_id=$currentUserID');
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
      _savedMiscards = temp;
      update();
    } catch (e) {
      print("e get saved");
      print(e);
    }

    _fromLike = false;
    _fromHome = false;
    _fromSaved = true;
    _fromTrending = false;
    _reqSavedDone = true;
  }

  Future<void> getDraftMisCards() async {
    print('Getting Draft MisCard');
    var url = Uri.parse(
        '${BaseRoute.domain}/api/users/$currentUserID/drafts/?ordering=-created_at');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      data = data['results'] as List;
      // print(data);
      List<MisCard> temp = [];
      data.forEach((element) {
        MisCard mc = MisCard.fromMap(element);
        temp.add(mc);
      });
      _draftMisCards = temp;
      update();
    } catch (e) {
      print("e get draft miscards");
      print(e);
    }
    _reqDraftDone = true;
  }
}
