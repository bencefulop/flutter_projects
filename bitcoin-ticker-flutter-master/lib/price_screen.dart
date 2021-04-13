import 'dart:async';
import 'services/api_handler.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'services/exchange.dart';
import 'constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  PriceScreen({this.displayedExchangeRate});
  final displayedExchangeRate;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  ExchangeModel exchangeModel = ExchangeModel();

  String selectedCurrency = 'AUD';
  String displayedExchangeRate = 'loading...';

  void initialUiUpdate(String currency) async {
    var exchangeData = await exchangeModel.getExchangeRate(currency);
    updateTextUI(exchangeData);
  }

  Widget getCurrencyItemsForAndroid() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        print(value);
      },
    );
  }

  Widget getCurrencyItemsForiOS() {
    List<Widget> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(
        Text(
          currency,
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (value) async {
        var exchangeData =
            await exchangeModel.getExchangeRate(currenciesList[value]);
        selectedCurrency = currenciesList[value];
        updateTextUI(exchangeData);
      },
      children: pickerItems,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return getCurrencyItemsForiOS();
    }
    if (Platform.isAndroid) {
      return getCurrencyItemsForAndroid();
    }
  }

  void updateTextUI(dynamic exchnageRateData) {
    setState(() {
      if (exchnageRateData == null) {
        displayedExchangeRate = 'loading...';
      } else {
        print(exchnageRateData);
        displayedExchangeRate = exchnageRateData;
      }
    });
  }

  @override
  void initState() {
    initialUiUpdate(selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $displayedExchangeRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: kExchangeRatioTextStytle,
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
