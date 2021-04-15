import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '5FEA4772-36C2-4489-A7FF-BD15604F62A3'; // personal email
// const apiKey = 'F1AD2334-6205-48D9-8AB6-B44CC1CDD3B7';

class ApiHandler {
  Future getExchangeRate(selectedCrypto, selectedCurrency) async {
    http.Response response = await http.get(
      Uri.https(
        'rest.coinapi.io',
        'v1/exchangerate/$selectedCrypto/$selectedCurrency',
        {'apikey': '$apiKey'},
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      double exchangeResponse = json.decode(data)['rate'];
      return exchangeResponse.toStringAsFixed(2);
    } else {
      print(response.statusCode);
    }
  }
}
