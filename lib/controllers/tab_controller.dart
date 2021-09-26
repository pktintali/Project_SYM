import 'package:get/get.dart';

class MyTabController extends GetxController {
  int _selectedTab = 0;

  int get getTab => _selectedTab;

  void updateSelectedTab(int tab) {
    _selectedTab = tab;
    update();
  }
}
