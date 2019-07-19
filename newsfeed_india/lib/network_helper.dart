import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<dynamic> getNewsFeed() async {
    dynamic newsFeed;
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=72287cd63c8045fdbcf9525656ee0268';
    print('Making the http call now!');
    var resp = await http.get(url);
    print(resp);
    if (resp.statusCode == 200) {
      var jsonResp = jsonDecode(resp.body);
      newsFeed = jsonResp['articles'];
    }
    return newsFeed;
  }
}
