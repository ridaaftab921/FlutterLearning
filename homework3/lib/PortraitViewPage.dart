import 'package:flutter/material.dart';
import 'package:homework3/ListWidget.dart';
import 'package:homework3/ProfileWidget.dart';

class PortraitViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PortraitViewState();
  }
}

class PortraitViewState extends State<PortraitViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Week 3 Assignment'),
      ),
      drawer: drawerWidget(context),
      body: ProfileWidget(),
    );
  }

  Widget drawerWidget(BuildContext context) {
    return Drawer(
        child: ListWidget()
     );
  }
}
