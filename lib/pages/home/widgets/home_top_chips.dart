import 'package:flutter/material.dart';
import 'package:project_sym/pages/home/constants.dart';

class HomeTopChips extends StatelessWidget {
  const HomeTopChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: MediaQuery.of(context).size.width - 5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constants.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: ActionChip(
              backgroundColor: Colors.white,
              label: Text(Constants.categoryList[index]),
              onPressed: () {
                
              },
            ),
          );
        },
      ),
    );
  }
}
