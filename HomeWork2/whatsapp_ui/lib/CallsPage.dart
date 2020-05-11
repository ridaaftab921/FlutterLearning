import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 2'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.call_received, size: 17, color: Colors.red,),
              Text('2.40 pm')
            ],
          ),
          trailing: Icon(Icons.phone),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 7'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.call_made, size: 17, color: Colors.green,),
              Text('1.40 pm')
            ],
          ),
          trailing: Icon(Icons.phone),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 5'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.call_received, size: 17, color: Colors.red,),
              Text('9: 35 am')
            ],
          ),
          trailing: Icon(Icons.phone),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xFF128C7E),
            child: Icon(Icons.person),
          ),
          title: Text('Conact 4'),
          subtitle: Row(
            children: <Widget>[
              Icon(Icons.call_received, size: 17, color: Colors.green,),
              Text('8.40 am')
            ],
          ),
          trailing: Icon(Icons.phone),
        )
      ],
    );
  }
}
