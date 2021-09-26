import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/controllers/tab_controller.dart';
import 'package:project_sym/pages/home/home_page.dart';
import 'package:project_sym/pages/profile/profile_page.dart';
import 'package:project_sym/pages/trending/trending_page.dart';

class TabPage extends StatelessWidget {
  TabPage({Key? key}) : super(key: key);

  final controller = Get.put(MyTabController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTabController>(
      builder: (_) {
        return Scaffold(
          body: _getTab(controller.getTab),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.getTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up), label: 'Trending'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Profile'),
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
      return const TrendingPage();
    } else if (index == 2) {
      return const ProfilePage();
    }
    return const HomePage();
  }
}
