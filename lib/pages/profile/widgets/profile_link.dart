import 'package:flutter/material.dart';

class ProfileLink extends StatelessWidget {
  const ProfileLink({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          const Text('Link:'),
          const SizedBox(width: 5),
          SizedBox(
            height: 18,
            child: TextButton(
              child: const Text('linkinbio.xyz'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
