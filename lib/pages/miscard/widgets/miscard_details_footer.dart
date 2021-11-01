import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/flipcard_details_controller.dart';

class MisCardDetailsFooter extends StatelessWidget {
  MisCardDetailsFooter({Key? key}) : super(key: key);
  final FlipCardDetailsController ctrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlipCardDetailsController>(builder: (_) {
      return Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              ctrl.isFront ? Colors.deepOrangeAccent[400] : Colors.green[900],
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          onPressed: () {
            ctrl.fController.toggleCard();
          },
          child: const Text('Flip'),
        ),
      );
    });
  }
}
