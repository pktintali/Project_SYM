import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_sym/components/miscard_widget.dart';
import 'package:project_sym/controllers/api/miscard_search_controller.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);
  final msc = Get.put(MisCardSearchController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search any MisCards...',
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    suffixIcon: const Icon(
                      Icons.search_outlined,
                      color: Colors.green,
                    ),
                  ),
                  onChanged: (v) async {
                    if (v != '') {
                      await msc.searchMiscards(v);
                    }
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<MisCardSearchController>(
              builder: (_) {
                return ListView.builder(
                  itemCount: msc.searchResult.length,
                  itemBuilder: (c, i) {
                    return MisCardWidget(miscard: msc.searchResult[i]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
