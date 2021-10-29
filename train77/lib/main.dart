import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;

  void sum() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lần 7'),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Column(
            children: [
              FlatButton(
                  color: Colors.deepOrange,
                  onPressed: () {},
                  child: Text('Click me'))
            ],
          ),
        ),
      ),
    );
  }
}
