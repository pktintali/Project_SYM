import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/comment.dart';
import 'base_route.dart';

class MisCardDetailController extends GetxController {
  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');
  TextEditingController commentBoxTextController = TextEditingController();
  String commentBoxText = '';
  int _totalComments = 0;
  int currentPageNumber = 1;
  int _likeCountMaintainer = 0;
  int _likedID = 0;
  int _disLikedID = 0;
  int _savedID = 0;
  bool orderCByLikes = true;
  bool nextPage = false;
  bool prevPage = false;
  bool _isLiked = false;
  bool _initiallyLiked = false;
  bool _isDisLiked = false;
  bool _isSaved = false;
  bool _writingMode = false;
  List<Comment> _comments = [];
  List<Comment> get comments => [..._comments];
  int get totalComments => _totalComments;
  bool get isLikedByUser => _isLiked;
  bool get isDisLikedByUser => _isDisLiked;
  bool get isSavedByUser => _isSaved;
  bool get writingMode => _writingMode;
  int get likeCountMaintainer => _likeCountMaintainer;
  bool get initiallyLiked => _initiallyLiked;
  bool checkedForStatus = false;

  void updateWritingMode(bool v) {
    _writingMode = v;
    update();
  }

  Future<bool> getComments({required int id, bool orderByLikes = true}) async {
    orderCByLikes = orderByLikes;
    String ordering = '-created_at';
    int page = currentPageNumber;
    if (orderByLikes) {
      ordering = '-likes_count,-created_at';
    }
    var url = Uri.parse(
        '${BaseRoute.domain}/miscards/$id/comments/?ordering=$ordering&page=$page');

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
        Uri.parse('${BaseRoute.domain}/miscards/$miscardID/comments/');
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
    } catch (e) {
      print("e Writing Comment");
      print(e);
    }
  }

  Future<void> isSaved(int miscardID) async {
    var url = Uri.parse(
        '${BaseRoute.domain}/saved_miscards/?user_id=$currentUserID&miscard_id=$miscardID');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      // print(data);

      if (data['count'] == 1) {
        _savedID = data['results'][0]['id'];
        _isSaved = true;
      } else {
        _isSaved = false;
      }
    } catch (e) {
      _isSaved = false;
      print(e);
    }
    checkedForStatus = true;
    update();
  }

  Future<void> isDisLiked(int miscardID) async {
    var url = Uri.parse(
        '${BaseRoute.domain}/miscards/$miscardID/dislikes/?user__id=$currentUserID');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      // print(data);

      if (data['count'] == 1) {
        _disLikedID = data['results'][0]['id'];
        _isDisLiked = true;
      } else {
        _isDisLiked = false;
      }
    } catch (e) {
      _isDisLiked = false;
      print(e);
    }
    await isSaved(miscardID);
  }

  Future<void> isLiked(int miscardID) async {
    var url = Uri.parse(
        '${BaseRoute.domain}/miscards/$miscardID/likes/?user__id=$currentUserID');
    try {
      http.Response response =
          await http.get(url, headers: {'Authorization': "token $token"});
      var data = json.decode(response.body);
      // print(data);

      if (data['count'] == 1) {
        _initiallyLiked = true;
        _isLiked = true;
        _likedID = data['results'][0]['id'];
        await isSaved(miscardID);
      } else {
        _isLiked = false;
        await isDisLiked(miscardID);
      }
    } catch (e) {
      _isLiked = false;
      print(e);
    }
  }

  Future<void> handleLike({required int miscardID}) async {
    if (!_isLiked) {
      var url = Uri.parse('${BaseRoute.domain}/miscards/$miscardID/likes/');
      try {
        http.Response response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
        );
        var data = json.decode(response.body) as Map;
        print(data);
        if (data['id'] != null) {
          if (_initiallyLiked) {
            _likeCountMaintainer = 0;
          } else {
            _likeCountMaintainer = 1;
          }
          _isDisLiked = false;
          _likedID = data['id'];
          _isLiked = true;
          update();
        }
      } catch (e) {
        print("e Linking");
        print(e);
      }
    } else {
      var url = Uri.parse(
          '${BaseRoute.domain}/miscards/$miscardID/likes/$_likedID/');
      try {
        await http.delete(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
        );
        if (_initiallyLiked) {
          _likeCountMaintainer = -1;
        } else {
          _likeCountMaintainer = 0;
        }
        _isLiked = false;
        _likedID = 0;
        update();
        // }
      } catch (e) {
        print("e unliking");
        print(e);
      }
    }
  }

  Future<void> handleDislike({required int miscardID}) async {
    if (!_isDisLiked) {
      var url =
          Uri.parse('${BaseRoute.domain}/miscards/$miscardID/dislikes/');
      try {
        http.Response response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
        );
        var data = json.decode(response.body) as Map;
        print(data);
        if (data['id'] != null) {
          if (_isLiked) {
            _likeCountMaintainer -= 1;
          }
          _isLiked = false;
          _disLikedID = data['id'];
          _isDisLiked = true;
          update();
        }
      } catch (e) {
        print("e DisLinking");
        print(e);
      }
    } else {
      var url = Uri.parse(
          '${BaseRoute.domain}/miscards/$miscardID/dislikes/$_disLikedID/');
      try {
        await http.delete(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
        );

        _isDisLiked = false;
        _disLikedID = 0;
        update();
        // }
      } catch (e) {
        print("e unliking");
        print(e);
      }
    }
  }

  Future<void> handleSave({required int miscardID}) async {
    if (!_isSaved) {
      var url = Uri.parse('${BaseRoute.domain}/saved_miscards/');
      try {
        http.Response response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
          body: json.encode({"miscard": miscardID}),
        );
        var data = json.decode(response.body) as Map;
        print(data);
        if (data['id'] != null) {
          _savedID = data['id'];
          _isSaved = true;
          update();
        }
      } catch (e) {
        print("e Saving");
        print(e);
      }
    } else {
      var url = Uri.parse('${BaseRoute.domain}/saved_miscards/$_savedID/');
      try {
        await http.delete(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "token $token"
          },
        );

        _isSaved = false;
        _savedID = 0;
        update();
      } catch (e) {
        print("e unsaving");
        print(e);
      }
    }
  }
}
