import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper(this.url);
  late double latitude;
  late double longitude;

  final String url;

  void getData() async {
    http.Response response = await http.get(Uri.https(
        'api.openweathermap.org',
        'data/2.5/weather',
        {'lat': '$latitude', 'lon': '$longitude', 'appid': '$apiKey'}));
    if (response.statusCode == 200) {
      String data = response.body;

      var decodeData = json.decode(data);

      print(cityName);
    } else {
      print(response.statusCode);
    }
  }
}
