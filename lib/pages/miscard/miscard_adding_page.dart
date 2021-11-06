import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/api/miscard_controller.dart';
import 'package:project_sym/controllers/api/miscard_create_controller.dart';
import 'package:project_sym/models/miscard.dart';

class MisCardAddingPage extends StatelessWidget {
  final MisCard? miscard;
  MisCardAddingPage({Key? key, this.miscard}) : super(key: key);
  final controller = Get.put(MisCardCreateController());
  final MisCardController mcc = Get.find();
  @override
  Widget build(BuildContext context) {
    if (miscard != null) {
      controller.setTitle = miscard!.title;
      controller.setMistake = miscard!.mistake;
      controller.setLesson = miscard!.lesson;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Miscard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Title'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: TextFormField(
                    initialValue: miscard != null ? miscard!.title : '',
                    decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.all(0.0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (v) {
                      controller.setTitle = v;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Mistake'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: TextFormField(
                    initialValue: miscard != null ? miscard!.mistake : '',
                    minLines: 5,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.all(0.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (v) {
                      controller.setMistake = v;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Lesson'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: TextFormField(
                    initialValue: miscard != null ? miscard!.lesson : '',
                    minLines: 5,
                    maxLines: 7,
                    decoration: const InputDecoration(
                      // contentPadding: EdgeInsets.all(0.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (v) {
                      controller.setLesson = v;
                    },
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    GetBuilder<MisCardCreateController>(
                      builder: (_) {
                        return Checkbox(
                          value: controller.allowedComment,
                          fillColor:
                              MaterialStateProperty.all(Colors.green[800]),
                          onChanged: (v) {
                            controller.toogleAllowComment();
                          },
                        );
                      },
                    ),
                    const Text('Allow Comments'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (miscard != null) {
                          await controller.deleteMiscard(miscard!.id);
                          await mcc.getDraftMisCards();
                        }
                        Get.back();
                      },
                      child: Text(miscard != null ? 'Delete' : 'Discard'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepOrange,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (controller.title == '' &&
                            controller.mistake == '' &&
                            controller.lesson == '') {
                          Get.defaultDialog(
                            middleText: 'Empty MisCard Discarded',
                            onConfirm: () {
                              Get.back();
                            },
                          ).then((value) => Navigator.pop(context));
                        } else {
                          await controller
                              .handleDraftSave(
                                title: controller.title,
                                mistake: controller.mistake,
                                lesson: controller.lesson,
                                draftID: miscard != null ? miscard!.id : null,
                                put: miscard != null ? true : false,
                              )
                              .then(
                                (value) => Get.defaultDialog(
                                  middleText: 'Draft Saved',
                                  onConfirm: () {
                                    Get.back();
                                  },
                                ),
                              )
                              .then((value) => Navigator.pop(context));
                          if(miscard!=null){
                            await mcc.getDraftMisCards();
                          }
                        }
                      },
                      child: const Text(
                        'Save Draft',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (controller.title != '' &&
                            controller.mistake != '' &&
                            controller.lesson != '') {
                          await controller
                              .addMisCard(
                                title: controller.title,
                                mistake: controller.mistake,
                                lesson: controller.lesson,
                                miscardID: miscard!=null?miscard!.id:null,
                              )
                              .then(
                                (value) => Get.defaultDialog(
                                  middleText: 'MisCard Created Successfully',
                                  onConfirm: () {
                                    Get.back();
                                  },
                                ),
                              );
                          if(miscard!=null){
                            await mcc.getDraftMisCards();
                          }
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Publish'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.green[800],
                        ),
                      ),
                    ),
                  ],
                ),
                //Think about preview
              ],
            ),
          ),
        ),
      ),
    );
  }
}
