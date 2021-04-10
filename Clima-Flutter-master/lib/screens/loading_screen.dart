import 'package:flutter/material.dart';
import '../services/location.dart';

const apiKey = 'c4d1e1a72352856f3b3c92dffaf18032';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
