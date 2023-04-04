// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Latestcrypto _$LatestcryptoFromJson(Map<String, dynamic> json) => Latestcrypto(
      id: json['id'] as String? ?? ' ',
      symbol: json['symbol'] as String? ?? ' ',
      name: json['name'] as String? ?? ' ',
      image: json['image'] as String? ?? ' ',
      current_price: (json['current_price'] as num?)?.toDouble() ?? 0,
      price_change_percentage_24h:
          (json['price_change_percentage_24h'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$LatestcryptoToJson(Latestcrypto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.current_price,
      'price_change_percentage_24h': instance.price_change_percentage_24h,
    };

Bitcoin _$BitcoinFromJson(Map<String, dynamic> json) => Bitcoin(
      tickers: (json['tickers'] as List<dynamic>?)
              ?.map((e) => Exchange.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      market_data:
          MarketData.fromJson(json['market_data'] as Map<String, dynamic>),
      links: Link.fromJson(json['links'] as Map<String, dynamic>),
      genesis_date: json['genesis_date'] ?? '',
      description:
          Description.fromJson(json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BitcoinToJson(Bitcoin instance) => <String, dynamic>{
      'description': instance.description,
      'market_data': instance.market_data,
      'links': instance.links,
      'genesis_date': instance.genesis_date,
      'tickers': instance.tickers,
    };

Exchange _$ExchangeFromJson(Map<String, dynamic> json) => Exchange(
      base: json['base'] as String? ?? '',
      converted_volume: ConvertedVolume.fromJson(
          json['converted_volume'] as Map<String, dynamic>),
      converted_last: Convertedlast.fromJson(
          json['converted_last'] as Map<String, dynamic>),
      market: Market.fromJson(json['market'] as Map<String, dynamic>),
      target: json['target'] as String? ?? '',
      last: (json['last'] as num?)?.toDouble() ?? 0,
      volume: (json['volume'] as num?)?.toDouble() ?? 0,
      trade_url: json['trade_url'] as String? ?? '',
    );

Map<String, dynamic> _$ExchangeToJson(Exchange instance) => <String, dynamic>{
      'base': instance.base,
      'target': instance.target,
      'market': instance.market,
      'last': instance.last,
      'volume': instance.volume,
      'converted_last': instance.converted_last,
      'converted_volume': instance.converted_volume,
      'trade_url': instance.trade_url,
    };

ConvertedVolume _$ConvertedVolumeFromJson(Map<String, dynamic> json) =>
    ConvertedVolume(
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ConvertedVolumeToJson(ConvertedVolume instance) =>
    <String, dynamic>{
      'usd': instance.usd,
    };

Convertedlast _$ConvertedlastFromJson(Map<String, dynamic> json) =>
    Convertedlast(
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ConvertedlastToJson(Convertedlast instance) =>
    <String, dynamic>{
      'usd': instance.usd,
    };

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'name': instance.name,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      homepage: (json['homepage'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockchain_site: (json['blockchain_site'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      official_forum_url: (json['official_forum_url'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subreddit_url: json['subreddit_url'] as String? ?? '',
      repos_url: Repo.fromJson(json['repos_url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'blockchain_site': instance.blockchain_site,
      'official_forum_url': instance.official_forum_url,
      'subreddit_url': instance.subreddit_url,
      'repos_url': instance.repos_url,
    };

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
      github: (json['github'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'github': instance.github,
    };

MarketData _$MarketDataFromJson(Map<String, dynamic> json) => MarketData(
      market_cap:
          MarketCap.fromJson(json['market_cap'] as Map<String, dynamic>),
      market_cap_rank: json['market_cap_rank'] as int? ?? 0,
      fully_diluted_valuation: FullyDilutedValuation.fromJson(
          json['fully_diluted_valuation'] as Map<String, dynamic>),
      high_24h: High24.fromJson(json['high_24h'] as Map<String, dynamic>),
      low_24h: Low24.fromJson(json['low_24h'] as Map<String, dynamic>),
      total_supply: (json['total_supply'] as num?)?.toDouble() ?? 0,
      max_supply: (json['max_supply'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$MarketDataToJson(MarketData instance) =>
    <String, dynamic>{
      'market_cap': instance.market_cap,
      'market_cap_rank': instance.market_cap_rank,
      'fully_diluted_valuation': instance.fully_diluted_valuation,
      'high_24h': instance.high_24h,
      'low_24h': instance.low_24h,
      'total_supply': instance.total_supply,
      'max_supply': instance.max_supply,
    };

MarketCap _$MarketCapFromJson(Map<String, dynamic> json) => MarketCap(
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$MarketCapToJson(MarketCap instance) => <String, dynamic>{
      'usd': instance.usd,
    };

High24 _$High24FromJson(Map<String, dynamic> json) => High24(
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$High24ToJson(High24 instance) => <String, dynamic>{
      'usd': instance.usd,
    };

Low24 _$Low24FromJson(Map<String, dynamic> json) => Low24(
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$Low24ToJson(Low24 instance) => <String, dynamic>{
      'usd': instance.usd,
    };

FullyDilutedValuation _$FullyDilutedValuationFromJson(
        Map<String, dynamic> json) =>
    FullyDilutedValuation(
      usd: (json['usd'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$FullyDilutedValuationToJson(
        FullyDilutedValuation instance) =>
    <String, dynamic>{
      'usd': instance.usd,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      en: json['en'] as String? ?? '',
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'en': instance.en,
    };

LatestNews _$LatestNewsFromJson(Map<String, dynamic> json) => LatestNews(
      status: json['status'] as String? ?? '',
      totalResults: json['totalResults'] as int? ?? 0,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LatestNewsToJson(LatestNews instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      urlToImage: json['urlToImage'] as String? ?? '',
      publishedAt: json['publishedAt'] as String? ?? '',
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };
