import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var leftDiceNumber = 3;
  var rightDiceNumber = 1;

  var number = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(3) + 1;
      rightDiceNumber = Random().nextInt(3) + 1;
    });
  }

  void changeNumber() {
    number = Random().nextInt(2222);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lần 6'),
          backgroundColor: Colors.deepOrange,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FlatButton(
                        onPressed: () {
                          changeDiceFace();
                        },
                        child: Image.asset(
                            'assets/images/dice$leftDiceNumber.png')),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FlatButton(
                        onPressed: () {
                          changeDiceFace();
                        },
                        child: Image.asset(
                            'assets/images/dice$rightDiceNumber.png')),
                  )),
                ],
              ),
              FlatButton(
                color: Colors.orange,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                onPressed: () {
                  setState(() {
                    changeNumber();
                  });
                },
                child: Text('Random'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
                  '$number',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
