import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/api/edit_profile_controller.dart';
import '../../controllers/api/profile_page_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditProfileController pec = Get.put(EditProfileController());
    final ProfilePageController pc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<EditProfileController>(
            builder: (_) {
              if (pec.pickedImage != null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.file(pec.pickedImage!),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Icon(
                      Icons.image,
                      size: 200,
                      color: Colors.grey,
                    ),
                  ),
                );
              }
            },
          ),
          OutlinedButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.add_a_photo,
                    color: Colors.green,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Select Profile Pic',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            onPressed: () async {
              await pec.pickFile();
            },
          ),
          GetBuilder<EditProfileController>(
            builder: (_) {
              if (pec.uploading) {
                return const LinearProgressIndicator();
              } else {
                return const SizedBox();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Bio Link',
              ),
              onChanged: (v) {
                pec.bioLink = v;
              },
            ),
          ),
          //Create text field for about
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'About',
              ),
              onChanged: (v) {
                pec.about = v;
              },
            ),
          ),
          const SizedBox(height: 30),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (pec.pickedImage != null) {
                    pec.updateUploading(true);
                    await pec.updateDP();

                    await pc.getUser();
                  } else {
                    Get.defaultDialog(middleText: 'Select Image First');
                  }
                },
                child: const Text('Update'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
