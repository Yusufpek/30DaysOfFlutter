import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'liked_suggestions.dart';
import 'fonts.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _liked = Set<WordPair>();

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          _suggestions.addAll(generateWordPairs().take(10));
          //}
          return _buildRow(_suggestions[i], i);
        });
  }

  Widget _buildRow(WordPair w, int i) {
    final bool _alreadyLiked = _liked.contains(w);
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text(
            '${i + 1}',
            style: TextStyle(color: Colors.white),
          )),
      title: Text(
        '${w.asPascalCase}',
        style: biggerFont,
      ),
      trailing: Icon(
        _alreadyLiked ? Icons.favorite : Icons.favorite_border,
        color: _alreadyLiked ? Colors.orange : Colors.grey,
      ),
      onTap: () {
        setState(() {
          if (_alreadyLiked) {
            _liked.remove(w);
          } else {
            _liked.add(w);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (c) => LikedSuggestions(_liked)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Event Day 1'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.favorite), onPressed: _pushSaved)
          ],
        ),
        body: _buildSuggestions());
  }
}
