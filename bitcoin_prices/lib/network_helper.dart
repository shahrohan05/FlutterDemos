import 'dart:convert';

import 'package:http/http.dart' as http;

Future<double> getCoinPrice(String currency, String coinCode) async {
  double price = 0.0;
  String currencyCoinCode = coinCode + currency;
  String url =
      'https://apiv2.bitcoinaverage.com/indices/global/ticker/$currencyCoinCode';
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse['ask']);
    price = jsonResponse['ask'];
  }
  return price;
}
