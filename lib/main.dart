import 'package:flutter/material.dart';

import 'day1/random_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Event',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: RandomWords(),
    );
  }
}