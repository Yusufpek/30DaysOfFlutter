import 'package:flutter/material.dart';

import 'week1/random_words.dart';
import 'week2/app.dart';

void main() => runApp(ShrineApp());

//It is for week1 project
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
