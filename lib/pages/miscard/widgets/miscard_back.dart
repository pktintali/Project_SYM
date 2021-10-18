import 'package:flutter/material.dart';
import 'package:project_sym/pages/miscard/constants.dart';

class MisCardBack extends StatelessWidget {
  const MisCardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mdq = MediaQuery.of(context).size;
    return SizedBox(
      width: _mdq.width < 500 ? _mdq.width * 0.9 : _mdq.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 0.0),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                spreadRadius: 2.0,
                blurRadius: 4.0,
              ),
            ],
          ),
          child: SizedBox(
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Lesson',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.green,
                  height: 0.0,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(Constants.miscardDetails),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
