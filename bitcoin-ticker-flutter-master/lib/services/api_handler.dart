import 'package:http/http.dart' as http;
import 'dart:convert';
import '../price_screen.dart';

const apiKey = '5FEA4772-36C2-4489-A7FF-BD15604F62A3';

class ApiHandler {
  Future getExchangeRate() async {
    http.Response response = await http.get(
      Uri.https(
        'rest.coinapi.io',
        'v1/exchangerate/BTC/$selectedCurrency',
        {'apikey': '$apiKey'},
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      return json.decode(data)['rate'];
    } else {
      print(response.statusCode);
    }
  }
}
