import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'base_route.dart';

class EditProfileController extends GetxController {
  static final _tokenBox = GetStorage();
  var token = _tokenBox.read('token');
  var currentUserID = _tokenBox.read('userID');
  bool _uploading = false;
  String bioLink = '';
  String about = '';
  File? _pickedFile;
  bool get uploading => _uploading;
  File? get pickedImage => _pickedFile;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ['jpg', 'png'],
        );
    if (result != null) {
      _pickedFile = File(result.files.single.path!);
      print(_pickedFile!.path);
    } else {
      // User canceled the picker
    }
    update();
  }

  void updateUploading(bool v) {
    _uploading = v;
    update();
  }

  Future<void> updateDP() async {
    try {
      print(currentUserID);
      var request = http.MultipartRequest(
        'PATCH',
        Uri.parse("${BaseRoute.domain}/users/$currentUserID/"),
      );
      Map<String, String> headers = {
        "Authorization": "token $token",
        "Content-type": "multipart/form-data"
      };
      request.files.add(
        http.MultipartFile('profile_pic', _pickedFile!.readAsBytes().asStream(),
            _pickedFile!.lengthSync(),
            filename: _pickedFile!.path.split('/').last),
      );
      request.headers.addAll(headers);
      if(about!=''){
        request.fields['about'] = about;
      }
      if(bioLink!=''){
        request.fields['bio_link'] = bioLink;
      }
      // request.fields.addAll({"about": "test about"});
      var res = await request.send();
      print(res.headers);
      print("This is response:" + res.statusCode.toString());
      if (res.statusCode == 200) {
        Get.defaultDialog(
          middleText: 'Profile Pic Updated',
          confirm: TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Get.back();
            },
          ),
        ).then((value) => Get.back());
      }
    } catch (e) {
      print("e profile Miscard");
      print(e);
    }
    _uploading = false;
    update();
  }
}
