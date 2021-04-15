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
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  ExchangeModel exchangeModel = ExchangeModel();

  String selectedCurrency = 'AUD';
  String displayedBTCExchangeRate = 'loading...';
  String displayedETHExchangeRate = 'loading...';
  String displayedLTCExchangeRate = 'loading...';

  void initialUiUpdate(String crypto, String currency) async {
    var exchangeData = await exchangeModel.getExchangeRate(crypto, currency);
    updateTextUI(crypto, exchangeData);
  }

  void updateTextUI(String crypto, dynamic exchnageRateData) {
    switch (crypto) {
      case 'BTC':
        {
          setState(() {
            if (exchnageRateData == null) {
              displayedBTCExchangeRate = 'loading...';
            } else {
              print(exchnageRateData);
              displayedBTCExchangeRate = exchnageRateData;
            }
          });
        }
        break;
      case 'ETH':
        {
          setState(() {
            if (exchnageRateData == null) {
              displayedETHExchangeRate = 'loading...';
            } else {
              print(exchnageRateData);
              displayedETHExchangeRate = exchnageRateData;
            }
          });
        }
        break;
      case 'LTC':
        {
          setState(() {
            if (exchnageRateData == null) {
              displayedLTCExchangeRate = 'loading...';
            } else {
              print(exchnageRateData);
              displayedLTCExchangeRate = exchnageRateData;
            }
          });
        }
        break;
    }
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
        selectedCurrency = currenciesList[value];
        var exchangeDataBTC =
            await exchangeModel.getExchangeRate('BTC', currenciesList[value]);
        var exchangeDataETH =
            await exchangeModel.getExchangeRate('ETH', currenciesList[value]);
        var exchangeDataLTC =
            await exchangeModel.getExchangeRate('LTC', currenciesList[value]);
        updateTextUI('BTC', exchangeDataBTC);
        updateTextUI('ETH', exchangeDataETH);
        updateTextUI('LTC', exchangeDataLTC);
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

  @override
  void initState() {
    initialUiUpdate('BTC', selectedCurrency);
    initialUiUpdate('ETH', selectedCurrency);
    initialUiUpdate('LTC', selectedCurrency);
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
                  '1 BTC = $displayedBTCExchangeRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: kExchangeRatioTextStytle,
                ),
              ),
            ),
          ),
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
                  '1 ETH = $displayedETHExchangeRate $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: kExchangeRatioTextStytle,
                ),
              ),
            ),
          ),
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
                  '1 LTC = $displayedLTCExchangeRate $selectedCurrency',
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
