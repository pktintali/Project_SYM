import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_sym/utils/constants.dart';

import 'base_route.dart';

class MisCardCreateController extends GetxController {
  String _title = '';
  String _mistake = '';
  String _lesson = '';
  String _restrictedWord = '';
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

  void toggleAllowComment() {
    _allowComment = !_allowComment;
    update();
  }

  Future<void> addMisCard({
    required String title,
    required String mistake,
    required String lesson,
    int? miscardID,
  }) async {
    var url = Uri.parse('${BaseRoute.domain}/miscards/');
    if (isRestricted()) {
      await Get.defaultDialog(
        middleText:
            '["$_restrictedWord"] is restricted word, remove it to create MisCard',
        onConfirm: () {
          Get.back();
        },
      );
    } else {
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
        Get.defaultDialog(
          middleText: 'MisCard Created Successfully',
          onConfirm: () {
            Get.back();
          },
        );

        var data = json.decode(response.body) as Map;
        if (miscardID != null) {
          await deleteMiscard(miscardID);
        }
        print(data);
      } catch (e) {
        print("e Adding Miscard");
        print(e);
      }
    }
  }

  Future<void> addDraft({
    required String title,
    required String mistake,
    required String lesson,
  }) async {
    var url = Uri.parse('${BaseRoute.domain}/users/$currentUserID/drafts/');
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
      print("e Writing Draft");
      print(e);
    }
  }

  Future<void> updateDraft({
    required String title,
    required String mistake,
    required String lesson,
    int? draftID,
    bool editMode = false,
  }) async {
    Uri url;
    if (editMode) {
      url = Uri.parse('${BaseRoute.domain}/miscards/$draftID/');
    } else {
      url = Uri.parse(
          '${BaseRoute.domain}/users/$currentUserID/drafts/$draftID/');
    }
    try {
      http.Response response = await http.put(
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
      if (editMode) {
        print('Error updating miscard');
      } else {
        print("e Updating Draft");
      }
      print(e);
    }
  }

  Future<void> handleDraftSave({
    required String title,
    required String mistake,
    required String lesson,
    int? draftID,
    bool put = false,
    bool editMode = false,
  }) async {
    if (put) {
      await updateDraft(
          title: title,
          mistake: mistake,
          lesson: lesson,
          draftID: draftID,
          editMode: editMode);
    } else {
      await addDraft(title: title, mistake: mistake, lesson: lesson);
    }
  }

  Future<void> deleteMiscard(int draftID) async {
    Uri url =
        Uri.parse('${BaseRoute.domain}/users/$currentUserID/drafts/$draftID/');

    try {
      http.Response response = await http.delete(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token $token"
        },
      );
      var data = response.body;
      print(data);
    } catch (e) {
      print("e Deleting Draft/MisCard");
      print(e);
    }
  }

  bool isRestricted() {
    List<String> words = _mistake.split(" ");
    words.addAll(_lesson.split(" "));
    words.addAll(_title.split(" "));
    for (String w in words) {
      if (Constants.restrictedWords.contains(w.toLowerCase())) {
        _restrictedWord = w;
        return true;
      }
    }
    return false;
  }
}
