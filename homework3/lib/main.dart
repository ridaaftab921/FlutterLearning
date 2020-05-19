import 'package:flutter/material.dart';

import 'LandscapeViewPage.dart';
import 'PortraitViewPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Week 3 Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    return LayoutBuilder(
        builder: (context, orientation) {
          return OrientationBuilder(
            builder: (context, orientation) {
                return orientation == Orientation.portrait ? PortraitViewPage() : LandscapeViewPage();
            });
        }
    );

  }
}
