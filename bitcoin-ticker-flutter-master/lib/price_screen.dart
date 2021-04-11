import 'dart:async';

import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'services/api_handler.dart';
import 'constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

String selectedCurrency = 'AUD';
String displayedExchangeRate;

class _PriceScreenState extends State<PriceScreen> {
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
      onSelectedItemChanged: (value) {
        setState(() {
          sleep(Duration(seconds: 5));
          selectedCurrency = currenciesList[value];
          print(selectedCurrency);
          updateTextUI();
        });
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

  Future displayExchangeRate() async {
    ApiHandler apiHandler = ApiHandler();
    double exchangeRate = await apiHandler.getExchangeRate(selectedCurrency);
    return exchangeRate;
  }

  Widget updateTextUI() {
    displayExchangeRate();
    if (displayedExchangeRate != null) {
      return Text(
        '1 BTC = $displayedExchangeRate $selectedCurrency',
        textAlign: TextAlign.center,
        style: kExchangeRatioTextStytle,
      );
    } else {
      return Text(
        '1 BTC = loading... $selectedCurrency',
        textAlign: TextAlign.center,
        style: kExchangeRatioTextStytle,
      );
    }
  }

  @override
  void initState() {
    updateTextUI();
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
                child: updateTextUI(),
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
