import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 1'),
          subtitle: Text('text message'),
          trailing: Text('7:30 pm'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 2'),
          subtitle: Text('text message'),
          trailing: Text('2:30 pm'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 3'),
          subtitle: Text('text message'),
          trailing: Text('12:30 pm'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 4'),
          subtitle: Text('text message'),
          trailing: Text('6:30 am'),
        )
      ],
    );
  }
}
