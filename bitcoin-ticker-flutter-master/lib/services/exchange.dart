import 'api_handler.dart';

class ExchangeModel {
  Future<dynamic> getExchangeRate(String selectedCurrency) async {
    ApiHandler apiHandler = ApiHandler();
    print('calling API');
    var exchamgeData = await apiHandler.getExchangeRate(selectedCurrency);
    return exchamgeData.toString();
  }
}
