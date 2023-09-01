import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the Default Page',
              style: TextStyle(fontSize: 20),
            ),
            // You can customize this page as needed
          ],
        ),
      ),
    );
  }
}
