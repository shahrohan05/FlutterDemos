import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'network_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Prices',
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Bitcoin Prices'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currency = "INR";

  double btcPrice = 0.0;
  double ethPrice = 0.0;
  double ltcPrice = 0.0;

  void updateCoinPrices() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            content: Text('Loading prices, please wait!'),
          ),
    );

    btcPrice = await getCoinPrice(currency, 'BTC');
    ethPrice = await getCoinPrice(currency, 'ETH');
    ltcPrice = await getCoinPrice(currency, 'LTC');
    Navigator.of(context).pop();

    setState(() {});
  }

  DropdownButton<String> getDropdownButton(context) {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      items.add(DropdownMenuItem<String>(
        child: Text(currency),
        value: currency,
      ));
    }

    return DropdownButton(
      items: items,
      onChanged: (value) {
        currency = value;
        updateCoinPrices();
      },
      value: currency,
    );
  }

  CupertinoPicker getCupertinoPicker(context) {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.blueGrey[700],
      itemExtent: 25.0,
      onSelectedItemChanged: (index) {
        print(index);
      },
      children: items,
    );
  }

  @override
  void initState() {
    super.initState();
    updateCoinPrices();
    WidgetsBinding.instance.addPostFrameCallback((_) => updateCoinPrices());
  }

  @override
  Widget build(BuildContext context) {
    //updateCoinPrices(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CoinCard(
              coinType: 'BTC',
              coinPrice: btcPrice,
              currency: currency,
            ),
            CoinCard(
              coinType: 'ETH',
              coinPrice: ethPrice,
              currency: currency,
            ),
            CoinCard(
              coinType: 'LTC',
              coinPrice: ltcPrice,
              currency: currency,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 30.0,
        color: Colors.blueGrey[700],
        child: Container(
          height: 150.0,
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.0),
          child: Platform.isIOS
              ? getCupertinoPicker(context)
              : getDropdownButton(context),
        ),
      ),
    );
  }
}

class CoinCard extends StatelessWidget {
  CoinCard({
    this.currency,
    this.coinPrice,
    this.coinType,
  });

  final String coinType;
  final double coinPrice;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Card(
        margin: EdgeInsets.all(15.0),
        elevation: 15.0,
        child: Container(
          width: 350.0,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          alignment: Alignment.center,
          child: Text(
            '1 $coinType : ' +
                (coinPrice == 0.0 ? 'N/A' : '$coinPrice $currency'),
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
