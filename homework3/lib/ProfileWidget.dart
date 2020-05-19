import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 100,
                child: Icon(Icons.person, size: 100,)
            ),
            Container(
              height: 20
            ),
            Container(
              alignment: Alignment.center,
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('VentureDive', style: TextStyle( color: Colors.white), )
            ),
          ],
        );
      },
    );
  }
}
