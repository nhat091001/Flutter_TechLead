import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(BMICaculator());
}

class BMICaculator extends StatelessWidget {
  const BMICaculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepOrangeAccent,
        scaffoldBackgroundColor: Colors.black45,
      ),
      home: InputPage(),
    );
  }
}
