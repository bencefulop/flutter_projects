import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart';

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
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(Uri.https('api.openweathermap.org',
        'data/2.5/weather?q=London,uk&APPID=c4d1e1a72352856f3b3c92dffaf18032'));
    print('response is:');
    print(response);
  }

//   Future<Response> fetchAlbum() {
//   return http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));
// }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
