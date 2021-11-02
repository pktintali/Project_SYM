import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/api/miscard_create_controller.dart';

class MisCardAddingPage extends StatelessWidget {
  MisCardAddingPage({Key? key}) : super(key: key);
  final controller = Get.put(MisCardCreateController());
  @override
  Widget build(BuildContext context) {
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
                  child: TextField(
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
                  child: TextField(
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
                  child: TextField(
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
                // DropdownButton(
                //   isExpanded: true,
                //   hint: const Text('Select Category'),
                //   onChanged: (v) {},
                //   items: [
                //     DropdownMenuItem(
                //       value: 1,
                //       onTap: () {},
                //       child: const Text('1'),
                //     ),
                //     DropdownMenuItem(
                //       value: 2,
                //       onTap: () {},
                //       child: const Text('2'),
                //     ),
                //     DropdownMenuItem(
                //       value: 3,
                //       onTap: () {},
                //       child: const Text('3'),
                //     ),
                //   ],
                // ),
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
                      onPressed: () {},
                      child: const Text('Discard'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepOrange,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
                              )
                              .then(
                                (value) => Get.defaultDialog(
                                  middleText: 'MisCard Created Successfully',
                                  onConfirm: () {
                                    Get.back();
                                  },
                                ),
                              );
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
