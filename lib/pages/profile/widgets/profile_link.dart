import 'package:flutter/material.dart';

class ProfileLink extends StatelessWidget {
  final String? bioLink;
  const ProfileLink({Key? key, this.bioLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          const Text('Link:'),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                bioLink??'',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
