import 'package:flutter/material.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text('Go Forwards To Screen 2'),
          onPressed: () {
            Navigator.push(
              context,
              // in this case we're creating the route as we go,
              // instead of using NamedRoutes.
              // This is handy for small apps.
              MaterialPageRoute(
                builder: (contenxt) {
                  return Screen2();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
