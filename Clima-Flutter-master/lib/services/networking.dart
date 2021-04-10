import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'c4d1e1a72352856f3b3c92dffaf18032';

class Networkhelper {
  Networkhelper(this.url, this.unencodedPath, this.latitude, this.longitude);
  final double latitude;
  final double longitude;
  final String url;
  final String unencodedPath;

  Future getData() async {
    http.Response response = await http.get(Uri.https(
        '$url', '$unencodedPath', {
      'lat': '$latitude',
      'lon': '$longitude',
      'appid': '$apiKey',
      'units': 'metric'
    }));
    if (response.statusCode == 200) {
      String data = response.body;

      return json.decode(data);
    } else {
      print(response.statusCode);
    }
  }
}
