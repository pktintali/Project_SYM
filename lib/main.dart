import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:project_sym/pages/tab/tab_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.amber[100],
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: Colors.green[800],
        ),
      ),
      title: 'Project SYM',
      home: TabPage(),
    );
  }
}
