import 'package:http/http.dart' as http;
import 'dart:convert';
// import '../price_screen.dart';

// const apiKey = '5FEA4772-36C2-4489-A7FF-BD15604F62A3'; // personal email
const apiKey = 'F1AD2334-6205-48D9-8AB6-B44CC1CDD3B7';

class ApiHandler {
  Future getExchangeRate(selectedCurrency) async {
    http.Response response = await http.get(
      Uri.https(
        'rest.coinapi.io',
        'v1/exchangerate/BTC/$selectedCurrency',
        {'apikey': '$apiKey'},
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      double exchangeRate = json.decode(data)['rate'];
      print(exchangeRate);
      return exchangeRate;
    } else {
      double exchangeRate = 2.9;
      // print(response.statusCode);
      // print(response.body);
      // print(exchangeRate);
      return exchangeRate;
    }
  }
}
