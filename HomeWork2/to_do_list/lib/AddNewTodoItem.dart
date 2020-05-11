import 'package:flutter/material.dart';

class AddNewTodoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Add a new task"),

      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: TextField(
          autofocus: true,
          onSubmitted: (text) {
            _sendDataBack(context, text);
          },
          decoration: InputDecoration(
              hintText: "Enter new item in todo list ... "
          ),
        ),
      )
    );
  }

  void _sendDataBack(BuildContext context, String todoItem) {
    Navigator.of(context).pop(todoItem);
  }

}
