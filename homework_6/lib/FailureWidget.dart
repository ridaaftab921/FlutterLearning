import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Couldn\'t load weather data for selected city',
        style: TextStyle(
            color: Colors.red,
            fontSize: 16
        ),
      ),
    );
  }
}