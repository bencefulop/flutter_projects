import 'api_handler.dart';

class ExchangeModel {
  Future<dynamic> getExchangeRate(String selectedCurrency) async {
    ApiHandler apiHandler = ApiHandler();
    print('calling API');
    var exchangeData = await apiHandler.getExchangeRate(selectedCurrency);
    return exchangeData.toString();
  }
}
