import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_sym/controllers/api/base_route.dart';
import 'package:project_sym/models/comment.dart';
import 'package:http/http.dart' as http;

class MisCardDetailController extends GetxController {
  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');
  int _totalComments = 0;
  TextEditingController commentBoxTextController = TextEditingController();
  String commentBoxText = '';
  int currentPageNumber = 1;
  bool orderCByLikes = true;
  bool nextPage = false;
  bool prevPage = false;
  bool _isLiked = false;
  List<Comment> _comments = [];
  List<Comment> get comments => [..._comments];
  int get totalComments => _totalComments;
  bool get isLikedByUser => _isLiked;

  Future<bool> getComments({required int id, bool orderByLikes = true}) async {
    orderCByLikes = orderByLikes;
    String ordering = '-created_at';
    int page = currentPageNumber;
    if (orderByLikes) {
      ordering = '-likes_count,-created_at';
    }
    var url = Uri.parse(
        '${BaseRoute.domain}/api/miscards/$id/comments/?ordering=$ordering&page=$page');

    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      // print(response.body);
      var data = json.decode(response.body);
      _totalComments = data['count'];
      if (data['next'] != null) {
        nextPage = true;
      } else {
        nextPage = false;
      }
      if (data['previous'] != null) {
        prevPage = true;
      } else {
        prevPage = false;
      }
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

  Future<void> getNextPageComment({required int cardID}) async {
    ++currentPageNumber;
    await getComments(id: cardID, orderByLikes: orderCByLikes);
  }

  Future<void> getPrevPageComment({required int cardID}) async {
    --currentPageNumber;
    await getComments(id: cardID, orderByLikes: orderCByLikes);
  }

  Future<void> writeComment({required int miscardID}) async {
    var url =
        Uri.parse('${BaseRoute.domain}/api/miscards/$miscardID/comments/');
    try {
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "token $token"
        },
        body: json.encode({"description": commentBoxText}),
      );
      var data = json.decode(response.body) as Map;
      print(data);
      commentBoxTextController.clear();
      getComments(id: miscardID, orderByLikes: false);
      //TODO: Show added comment first from retrived response
    } catch (e) {
      print("e Writing Comment");
      print(e);
    }
  }

  Future<bool> isLiked(int miscardID) async {
    var url = Uri.parse(
        '${BaseRoute.domain}/api/miscards/$miscardID/likes/?user__id=$currentUserID');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      // print(data);
      if (data['count'] == 1) {
        _isLiked = true;
        return true;
      } else {
        _isLiked = false;
        return false;
      }
    } catch (e) {
      _isLiked = false;
      print(e);
      return false;
    }
  }
}
