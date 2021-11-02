import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/controllers/api/base_route.dart';

class MisCardCreateController extends GetxController {
  String _title = '';
  String _mistake = '';
  String _lesson = '';
  bool _allowComment = true;

  set setTitle(t) => _title = t;
  set setMistake(m) => _mistake = m;
  set setLesson(l) => _lesson = l;

  String get title => _title;
  String get mistake => _mistake;
  String get lesson => _lesson;
  bool get allowedComment => _allowComment;

  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');

  void toogleAllowComment() {
    _allowComment = !_allowComment;
    update();
  }

  Future<void> addMisCard({
    required String title,
    required String mistake,
    required String lesson,
  }) async {
    var url = Uri.parse('${BaseRoute.domain}/api/miscards/');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token $token"
        },
        body: json.encode({
          "title": title,
          "mistake": mistake,
          "lesson": lesson,
          "comment_allowed": _allowComment
        }),
      );
      var data = json.decode(response.body) as Map;
      print(data);
    } catch (e) {
      print("e Writing Comment");
      print(e);
    }
  }
}
