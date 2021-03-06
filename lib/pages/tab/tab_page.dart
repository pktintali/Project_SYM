import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/tab_controller.dart';
import '../home/home_page.dart';
import '../library/library_page.dart';
import '../miscard/miscard_adding_page.dart';
import '../profile/profile_page.dart';
import '../trending/trending_page.dart';
import 'home_topbar.dart';

class TabPage extends StatelessWidget {
  TabPage({Key? key}) : super(key: key);

  final controller = Get.put(MyTabController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTabController>(
      builder: (_) {
        return Scaffold(
          appBar: controller.getTab == 0 ? const HomeTopBar() : null,
          // floatingActionButtonLocation:FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: FloatingActionButton(
            mini: true,
            backgroundColor: Colors.green,
            onPressed: () {
              Get.to(
                () => MisCardAddingPage(),
                transition: Transition.downToUp,
              );
            },
            child: const Icon(Icons.add),
          ),
          // backgroundColor: Colors.amber[100],
          body: _getTab(controller.getTab),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(
              color: Colors.green,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            selectedItemColor: Colors.green[400],
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(color: Colors.green[400]),
            unselectedLabelStyle: TextStyle(color: Colors.green[400]),
            showUnselectedLabels: true,
            currentIndex: controller.getTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up), label: 'Trending'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_library), label: 'Library'),
            ],
            onTap: (index) {
              controller.updateSelectedTab(index);
            },
          ),
        );
      },
    );
  }

  Widget _getTab(int index) {
    if (index == 1) {
      return TrendingPage();
    } else if (index == 2) {
      return const ProfilePage();
    } else if (index == 3) {
      return LibraryPage();
    }
    return HomePage();
  }
}
