import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Text(
            'I am Poor',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          backgroundColor: Colors.amber[100],
        ),
        body: Center(
          child: Image(
              image: AssetImage('images/icons8-sad-cry-96.png'),
              height: 280,
              width: 280,
              fit: BoxFit.contain),
        ),
      ),
    ),
  );
}
