import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'c4d1e1a72352856f3b3c92dffaf18032';
const url = 'api.openweathermap.org';
const unencodedPath = 'data/2.5/weather';

class Networkhelper {
  Future getCityData(city) async {
    http.Response response = await http.get(
      Uri.https(
        '$url',
        '$unencodedPath',
        {'q': '$city', 'appid': '$apiKey', 'units': 'metric'},
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return json.decode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future getData(latitude, longitude) async {
    http.Response response = await http.get(
      Uri.https(
        '$url',
        '$unencodedPath',
        {
          'lat': '$latitude',
          'lon': '$longitude',
          'appid': '$apiKey',
          'units': 'metric'
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return json.decode(data);
    } else {
      print(response.statusCode);
    }
  }
}
