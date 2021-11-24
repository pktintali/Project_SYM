import 'dart:convert';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/miscard.dart';
import 'package:project_sym/models/profile.dart';
import 'package:project_sym/models/user.dart';

class ProfilePageController extends GetxController {
  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');
  bool _miscardLoading = true;
  bool _userLoading = true;
  bool _isFollowing = false;
  int _noOfFollowers = 0;
  int? _followingObjectID;
  User? _user;
  Profile? _profile;
  User? _currentUser;
  User? get currentUser => _currentUser;
  List<MisCard> _profileMisCards = [];

  bool get miscardLoading => _miscardLoading;
  bool get userLoading => _userLoading;
  bool get isFollowing => _isFollowing;
  int get noOfFollowers => _noOfFollowers;
  User? get user => _user;
  Profile? get profile => _profile;
  List<MisCard> get profileMisCards => [..._profileMisCards];

  Future<void> getProfile({required int userID}) async {
    Uri url = Uri.parse('${BaseRoute.domain}/api/users/$userID/profile/');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      // print(data);
      _profile = Profile.fromMap(data[0]);
      // print(temp);
    } catch (e) {
      _profile = Profile(
          id: 0, adminBadge: false, helperBadge: false, impactorBadge: false);
      print("e get User Profile");
      print(e);
    }
  }

  Future<void> getUser({int? userID}) async {
    _userLoading = true;
    Uri url;
    if (userID != null) {
      url = Uri.parse('${BaseRoute.domain}/api/users/$userID');
    } else {
      url = Uri.parse('${BaseRoute.domain}/api/currentuser/');
    }
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      // print(data);
      if (_user == null) {
        _currentUser = User.fromMap(data[0]);
      }
      if (userID != null) {
        _user = User.fromMap(data);
        await getProfile(userID: userID);
        await checkFollowingStatus(userID);
      } else {
        _user = User.fromMap(data[0]);
        _currentUser = User.fromMap(data[0]);
        await getProfile(userID: data[0]['id']);
        await checkFollowingStatus(currentUserID);
      }
      _userLoading = false;
      // print(temp);
      update();
    } catch (e) {
      print("e get User");
      print(e);
    }
  }

  Future<void> getProfileMisCards({int? userID}) async {
    print('Getting Profile MisCards');
    int uID;
    if (userID != null) {
      uID = userID;
    } else {
      uID = currentUserID;
    }
    var url = Uri.parse(
        '${BaseRoute.domain}/api/miscards/?ordering=-created_at&user_id=$uID');

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

  Future<void> handleFollowButton(int uId) async {
    var url = Uri.parse('${BaseRoute.domain}/api/followings/');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token $token"
        },
        body: json.encode({"user": uId}),
      );
      var data = json.decode(response.body) as Map;
      // print(data);
      await checkFollowingStatus(uId);
    } catch (e) {
      print("e followig");
      print(e);
    }
  }

  Future<void> handleUnfollow(int uId) async {
    if (_followingObjectID != null) {
      var url =
          Uri.parse('${BaseRoute.domain}/api/followings/$_followingObjectID/');
      try {
        http.Response response = await http.delete(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
        );
        // var data = json.decode(response.body) as Map;
        print(response);
        await checkFollowingStatus(uId);
      } catch (e) {
        print("e unfollowig");
        print(e);
      }
    }
  }

  Future<void> checkFollowingStatus(int id) async {
    Uri url = Uri.parse('${BaseRoute.domain}/api/followings/?user_id=$id');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      // print(data);
      _noOfFollowers = data['count'];
      if (_noOfFollowers != 0) {
        data = data['results'] as List;
        for (int i = 0; i < data.length; i++) {
          if (data[i]['followed_by']['id'] == currentUserID) {
            _isFollowing = true;
            _followingObjectID = data[i]['id'];
            break;
          } else {
            _isFollowing = false;
            _followingObjectID = null;
          }
        }
      } else {
        _isFollowing = false;
        _followingObjectID = null;
      }
      update();
    } catch (e) {
      print("e get User chekFollowStatus");
      print(e);
    }
  }
}
