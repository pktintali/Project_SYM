import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_sym/models/comment.dart';
import 'package:http/http.dart' as http;

class MisCardDetailController extends GetxController {
  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');
  int _totalComments = 0;

  List<Comment> _comments = [];
  Future<bool> getComments(int id) async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/api/miscards/$id/comments/?ordering=-likes_count,-created_at');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      _totalComments = data['count'];
      data = data['results'] as List;
      // print(data);
      List<Comment> temp = [];
      data.forEach((element) {
        Comment mc = Comment.fromMap(element);
        temp.add(mc);
      });
      _comments = temp;
      update();
      return true;
    } catch (e) {
      print("e get comments");
      print(e);
      return false;
    }
  }

  List<Comment> get comments => [..._comments];
  int get totalComments => _totalComments;
}
