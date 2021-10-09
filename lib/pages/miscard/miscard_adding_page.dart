import 'package:flutter/material.dart';

class MisCardAddingPage extends StatelessWidget {
  const MisCardAddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Miscard'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Title'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: TextField(
                      decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(0.0),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    filled: true,

                    fillColor: Colors.white,
                  )),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Mistake'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: TextField(
                      minLines: 5,
                      maxLines: 10,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(0.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      )),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Lesson'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: TextField(
                      minLines: 5,
                      maxLines: 7,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.all(0.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      )),
                ),
                const SizedBox(height: 10),
                DropdownButton(
                  isExpanded: true,
                  hint: const Text('Select Category'),
                  onChanged: (v) {},
                  items: [
                    DropdownMenuItem(
                      value: 1,
                      onTap: () {},
                      child: const Text('1'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      onTap: () {},
                      child: const Text('2'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      onTap: () {},
                      child: const Text('3'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      fillColor: MaterialStateProperty.all(Colors.green[800]),
                      onChanged: (v) {},
                    ),
                    const Text('Allow Comments'),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Discard'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.deepOrange,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Save Draft',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Publish'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.green[800],
                        ),
                      ),
                    ),
                  ],
                ),
                //Think about preview
              ],
            ),
          ),
        ),
      ),
    );
  }
}
