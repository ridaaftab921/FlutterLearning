import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:homework_5/SavedWords.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  List<String> _saved = List<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void loadSavedWords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _saved = prefs.getStringList("saved");
  }


  Widget _buildSuggestions() {
    loadSavedWords();
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair.asPascalCase);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair.asPascalCase);
            removeWord(pair.asPascalCase);
          } else {
            _saved.add(pair.asPascalCase);
            saveWord(pair.asPascalCase);
          }
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[      // Add 3 lines from here...
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void saveWord(String word) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedList = prefs.getStringList("saved");
    if (savedList == null) {
      savedList = List<String>();
    }
    savedList.add(word);
    await prefs.setStringList("saved", savedList);
  }
  void removeWord(String word) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedList = prefs.getStringList("saved");
    if (savedList != null) {
      savedList.remove(word);
    }
    await prefs.setStringList("saved", savedList);
  }
  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return SavedWords();
        },
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}