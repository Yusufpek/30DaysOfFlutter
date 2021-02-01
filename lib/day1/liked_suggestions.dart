import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../day1/fonts.dart';

class LikedSuggestions extends StatelessWidget {
  final Set<WordPair> liked;
  LikedSuggestions(this.liked);

  @override
  Widget build(BuildContext context) {
    final tiles = liked.map(
      (WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: biggerFont,
          ),
        );
      },
    );
    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
