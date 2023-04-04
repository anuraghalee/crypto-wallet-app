import 'dart:convert';
import 'dart:core';
import 'package:cryptoapp/service/models.dart';
import 'package:http/http.dart';
import 'package:tuple/tuple.dart';

class API {
  var url1 = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';

  var url2 = 'https://newsapi.org/v2/everything?q=cryptocurrencies&apiKey=6c5a3d5a56d4483c908d6123eb50bd70';

  //coinlist
  Future<List<Latestcrypto>> getList() async {
    var response = await get(Uri.parse(url1));
    print('Call 2');
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      print(jsonData);
      List<Latestcrypto> listObj = List<Latestcrypto>.from(jsonData.map((e) => Latestcrypto.fromJson(e)));

      return listObj;
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  //newslist
  Future<List<Article>> getArticles() async {
    var response = await get(Uri.parse(url2));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      List<Article> listObj = [];

      for (var item in jsonData['articles']) {
        listObj.add(Article.fromJson(item));
      }

      return listObj;
    } else {
      throw Exception('Failed to Load Data');
    }
  }

  Future<Tuple5<String, MarketData, Link, String, List<Exchange>>> getDesc(id) async {
    var url3 = 'https://api.coingecko.com/api/v3/coins/$id?localization=false&tickers=true&market_data=true&developer_data=false&sparkline=false';
    print('Call 3');
    var response = await get(Uri.parse(url3));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var description = Description.fromJson(jsonData['description']);
      var str = description.en;
      var marketData = MarketData.fromJson(jsonData['market_data']);
      var links = Link.fromJson(jsonData['links']);
      var date = jsonData['genesis_date'] ?? '';
      var eList = jsonData['tickers'];
      List<Exchange> exchanges = [];

      for (var item in eList) {
        if (item != null) {
          exchanges.add(Exchange.fromJson(item));
        }
      }

      print(exchanges[0].market.name);
      return Tuple5(str, marketData, links, date, exchanges);
    } else {
      throw Exception('Failed to Load Data.');
    }
  }

  Future<List<Article>> getSNews(id) async {
    var url4 = 'https://newsapi.org/v2/everything?q=$id&language=en&sortBy=publishedAt&apiKey=6c5a3d5a56d4483c908d6123eb50bd70';
    var response = await get(Uri.parse(url4));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var jsonArt = jsonData['articles'];
      List<Article> aList = List<Article>.from(jsonArt.map((e) => Article.fromJson(e)));
      return aList;
    } else {
      throw Exception('Failed to Load Data');
    }
  }
}
