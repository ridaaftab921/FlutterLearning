import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('List item 1'),
        ),
        ListTile(
          title: Text('List item 2'),
        ),
        ListTile(
          title: Text('List item 3'),
        ),
        ListTile(
          title: Text('List item 4'),
        )
      ],
    );
  }
}
