import 'package:flutter/material.dart';
import 'package:homework3/ListWidget.dart';
import 'package:homework3/ProfileWidget.dart';

class LandscapeViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LandscapeViewState();
  }
}

class LandscapeViewState extends State<LandscapeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 3 Assignment'),
      ),
      body: Flex(direction: Axis.horizontal, children: <Widget>[
        Expanded(
          flex: 35,
          child: ListWidget(),
        ),
        Expanded(
            flex: 65,
            child: ProfileWidget())
        ]
      ),
    );
  }
}
