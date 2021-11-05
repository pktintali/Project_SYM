import 'package:flutter/material.dart';

class DateAndFollow extends StatelessWidget {
  final String dateJoined;
  const DateAndFollow({Key? key, required this.dateJoined}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text('Date Joined:'),
        ),
        const SizedBox(width: 8),
        Text(
          dateJoined.substring(0,10),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: const Text('Follow'),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
