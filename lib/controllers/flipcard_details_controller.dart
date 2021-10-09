import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FlipCardDetailsController extends GetxController {
  final FlipCardController _fController = FlipCardController();

  FlipCardController get fController => _fController;

  bool _isFront = true;
  bool get isFront => _isFront;
  void updateFront() {
    _isFront = !_isFront;
    update();
  }
}
