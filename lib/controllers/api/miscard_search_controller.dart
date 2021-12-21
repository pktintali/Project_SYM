import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/miscard.dart';
import 'base_route.dart';

class MisCardSearchController extends GetxController {
  static final _tokenBox = GetStorage();
  List<MisCard> _searchResults = [];

  List<MisCard> get searchResult => [..._searchResults];
  var token = _tokenBox.read('token');

  Future<void> searchMiscards(String keyword) async {
    print('Getting MisCards');
    var url = Uri.parse(
        '${BaseRoute.domain}/miscards/?ordering=-likes_count&search=$keyword');

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
      _searchResults = temp;
      update();
    } catch (e) {
      print("e search Miscards");
      print(e);
    }
  }
}
