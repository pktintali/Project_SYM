import 'package:flutter/material.dart';

class MisCardUserHeader extends StatelessWidget {
  const MisCardUserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: const [
          CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 18,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Pradeep Kumar',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Spacer(),
          Text(
            '12:36 PM 12/07/2021',
            style: TextStyle(
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }
}
