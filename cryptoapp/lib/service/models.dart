// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Latestcrypto {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double current_price;
  final double price_change_percentage_24h;

  Latestcrypto({
    this.id = ' ',
    this.symbol = ' ',
    this.name = ' ',
    this.image = ' ',
    this.current_price = 0,
    this.price_change_percentage_24h = 0,
  });

  factory Latestcrypto.fromJson(Map<String, dynamic> json) => _$LatestcryptoFromJson(json);

  Map<String, dynamic> toJson() => _$LatestcryptoToJson(this);
}

@JsonSerializable()
class Bitcoin {
  final Description description;
  final MarketData market_data;
  final Link links;
  final dynamic genesis_date;
  final List<Exchange> tickers;

  Bitcoin({this.tickers = const [], required this.market_data, required this.links, this.genesis_date = '', required this.description});

  factory Bitcoin.fromJson(Map<String, dynamic> json) => _$BitcoinFromJson(json);
  Map<String, dynamic> toJson() => _$BitcoinToJson(this);
}

@JsonSerializable()
class Exchange {
  final String base;
  final String target;
  final Market market;
  final double last;
  final double volume;
  final Convertedlast converted_last;
  final ConvertedVolume converted_volume;
  final String trade_url;

  Exchange({this.base = '', required this.converted_volume, required this.converted_last, required this.market, this.target = '', this.last = 0, this.volume = 0, this.trade_url = ''});

  factory Exchange.fromJson(Map<String, dynamic> json) => _$ExchangeFromJson(json);
  Map<String, dynamic> toJson() => _$ExchangeToJson(this);
}

@JsonSerializable()
class ConvertedVolume {
  final double usd;

  ConvertedVolume({this.usd = 0});

  factory ConvertedVolume.fromJson(Map<String, dynamic> json) => _$ConvertedVolumeFromJson(json);
  Map<String, dynamic> toJson() => _$ConvertedVolumeToJson(this);
}

@JsonSerializable()
class Convertedlast {
  final double usd;

  Convertedlast({this.usd = 0});

  factory Convertedlast.fromJson(Map<String, dynamic> json) => _$ConvertedlastFromJson(json);
  Map<String, dynamic> toJson() => _$ConvertedlastToJson(this);
}

@JsonSerializable()
class Market {
  final String name;

  Market({this.name = ''});

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
  Map<String, dynamic> toJson() => _$MarketToJson(this);
}

@JsonSerializable()
class Link {
  final List<String> homepage;
  final List<String> blockchain_site;
  final List<String> official_forum_url;
  final String subreddit_url;
  final Repo repos_url;

  Link({this.homepage = const [], this.blockchain_site = const [], this.official_forum_url = const [], this.subreddit_url = '', required this.repos_url});

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable()
class Repo {
  final List<String> github;

  Repo({this.github = const []});

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class MarketData {
  final MarketCap market_cap;
  final int market_cap_rank;
  final FullyDilutedValuation fully_diluted_valuation;
  final High24 high_24h;
  final Low24 low_24h;
  final double total_supply;
  final double max_supply;

  MarketData({
    required this.market_cap,
    this.market_cap_rank = 0,
    required this.fully_diluted_valuation,
    required this.high_24h,
    required this.low_24h,
    this.total_supply = 0,
    this.max_supply = 0,
  });

  factory MarketData.fromJson(Map<String, dynamic> json) => _$MarketDataFromJson(json);

  Map<String, dynamic> toJson() => _$MarketDataToJson(this);
}

@JsonSerializable()
class MarketCap {
  final double usd;

  MarketCap({this.usd = 0});

  factory MarketCap.fromJson(Map<String, dynamic> json) => _$MarketCapFromJson(json);
  Map<String, dynamic> toJson() => _$MarketCapToJson(this);
}

@JsonSerializable()
class High24 {
  final double usd;

  High24({this.usd = 0});

  factory High24.fromJson(Map<String, dynamic> json) => _$High24FromJson(json);
  Map<String, dynamic> toJson() => _$High24ToJson(this);
}

@JsonSerializable()
class Low24 {
  final double usd;

  Low24({this.usd = 0});

  factory Low24.fromJson(Map<String, dynamic> json) => _$Low24FromJson(json);
  Map<String, dynamic> toJson() => _$Low24ToJson(this);
}

@JsonSerializable()
class FullyDilutedValuation {
  final double usd;

  FullyDilutedValuation({this.usd = 0});

  factory FullyDilutedValuation.fromJson(Map<String, dynamic> json) => _$FullyDilutedValuationFromJson(json);
  Map<String, dynamic> toJson() => _$FullyDilutedValuationToJson(this);
}

@JsonSerializable()
class Description {
  final String en;

  Description({this.en = ''});

  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class LatestNews {
  final String status;
  final int totalResults;
  final List<Article> articles;

  LatestNews({
    this.status = '',
    this.totalResults = 0,
    this.articles = const [],
  });

  factory LatestNews.fromJson(Map<String, dynamic> json) => _$LatestNewsFromJson(json);

  Map<String, dynamic> toJson() => _$LatestNewsToJson(this);
}

@JsonSerializable()
class Article {
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Article({
    this.title = '',
    this.url = '',
    this.urlToImage = '',
    this.publishedAt = '',
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
