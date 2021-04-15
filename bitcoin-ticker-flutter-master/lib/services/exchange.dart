import 'api_handler.dart';

class ExchangeModel {
  Future<dynamic> getExchangeRate(
      String selectedCrypto, String selectedCurrency) async {
    ApiHandler apiHandler = ApiHandler();
    print('calling API');
    var exchangeData =
        await apiHandler.getExchangeRate(selectedCrypto, selectedCurrency);
    return exchangeData.toString();
  }
}
