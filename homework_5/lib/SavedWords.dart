import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedWordsState extends State<SavedWords> {
  var _suggestions = List<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void loadSavedWords() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _suggestions = prefs.getStringList("saved");
    });
  }

  Widget _buildSuggestions() {
    loadSavedWords();
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          return _buildRow(_suggestions[i]);
        });
  }
  Widget _buildRow(String word) {
    return ListTile(
      title: Text(
        word,
        style: _biggerFont,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: _buildSuggestions(),
    );
  }

}

class SavedWords extends StatefulWidget {
  @override
  SavedWordsState createState() => new SavedWordsState();
}