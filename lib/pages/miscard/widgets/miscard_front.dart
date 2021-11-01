import 'package:flutter/material.dart';

class MisCardFront extends StatelessWidget {
  final String mistake;
  const MisCardFront({Key? key, required this.mistake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mdq = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: _mdq.width < 500 ? _mdq.width * 0.9 : _mdq.width * 0.5,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 0.0),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepOrange,
                  spreadRadius: 2.0,
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent[400],
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
                          'Mistake',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Divider(
                //   color: Colors.deepOrange,
                //   height: 0.0,
                // ),
                Padding(
                  padding:const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(mistake),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
