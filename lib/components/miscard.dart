import 'package:flutter/material.dart';

class Miscard extends StatelessWidget {
  const Miscard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 8,),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(80)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Mistake',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                  'This is the long mistake that is described by author. Here Author will describe his/her mistake within 600 Characters.'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.lightGreenAccent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(80)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Lesson',
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                  'Here author will describe the 1st lesson that he learned from his/her mistake 300 Characters Limit '),
            ),
          ],
        ),
      ),
    );
  }
}
