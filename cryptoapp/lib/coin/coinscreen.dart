import 'package:cryptoapp/service/api.dart';
import 'package:cryptoapp/service/models.dart';
import 'package:cryptoapp/shared/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CoinScreen extends StatefulWidget {
  final String id;
  final String name;
  final String sym;
  final double price;
  final double per;
  final String img;

  const CoinScreen({super.key, required this.id, required this.name, required this.sym, required this.price, required this.per, required this.img});

  static Map<String, String> descData = {};
  static Map<String, MarketData> descData1 = {};
  static Map<String, Link> descData2 = {};
  static Map<String, String> descData3 = {};
  static Map<String, List<Exchange>> descData4 = {};
  static Map<String, List<Article>> snewsData = {};

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  String? desc = '';
  String? date = '';
  List<Exchange>? exch = [];
  MarketData? info = MarketData(
    market_cap: MarketCap(),
    fully_diluted_valuation: FullyDilutedValuation(),
    high_24h: High24(),
    low_24h: Low24(),
  );
  Link? social = Link(
    homepage: [],
    blockchain_site: ['', '', ''],
    official_forum_url: [],
    repos_url: Repo(),
  );
  List<Article>? sNews = [];
  double containerHeight = 1200;

  @override
  void initState() {
    super.initState();

    if (CoinScreen.descData.containsKey(widget.id)) {
      desc = CoinScreen.descData[widget.id];
      info = CoinScreen.descData1[widget.id];
      social = CoinScreen.descData2[widget.id];
      date = CoinScreen.descData3[widget.id];
      exch = CoinScreen.descData4[widget.id];
    } else {
      API().getDesc(widget.id).then((value) {
        setState(() {
          CoinScreen.descData1[widget.id] = value.item2;
          CoinScreen.descData[widget.id] = value.item1;
          CoinScreen.descData2[widget.id] = value.item3;
          CoinScreen.descData3[widget.id] = value.item4;
          CoinScreen.descData4[widget.id] = value.item5;
          desc = value.item1;
          info = value.item2;
          social = value.item3;
          date = value.item4;
          exch = value.item5;
        });
      });
    }

    if (CoinScreen.snewsData.containsKey(widget.id)) {
      sNews = CoinScreen.snewsData[widget.id];
    } else {
      API().getSNews(widget.id).then((value) {
        setState(() {
          CoinScreen.snewsData[widget.id] = value;
          sNews = value;
        });
      });
    }
  }

  String price(str) {
    final format = NumberFormat('#,##0.00').format(str);
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.backward),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
          child: Column(
            children: [
              DefaultTabController(
                length: 5,
                animationDuration: const Duration(milliseconds: 400),
                child: Container(
                  margin: const EdgeInsets.only(top: 60),
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.deepPurple.withOpacity(0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.1, 0.7],
                    ),
                    border: Border.all(
                      width: 3,
                      color: Colors.deepPurple.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -35),
                        child: Image.network(
                          widget.img,
                          height: 70,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -35),
                        child: SizedBox(
                          child: Text(
                            '\$${widget.price.toString()}',
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -35),
                        child: SizedBox(
                          child: Text(
                            '${widget.per.toStringAsFixed(4)}%',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ChartWidget(
                              id: widget.id,
                              days: 1,
                              idx: 0,
                              hex: '#7F9DFF',
                            ),
                            ChartWidget(
                              id: widget.id,
                              days: 7,
                              idx: 1,
                              hex: '#7F9DFF',
                            ),
                            ChartWidget(
                              id: widget.id,
                              days: 30,
                              idx: 2,
                              hex: '#7F9DFF',
                            ),
                            ChartWidget(
                              id: widget.id,
                              days: 90,
                              idx: 3,
                              hex: '#7F9DFF',
                            ),
                            ChartWidget(
                              id: widget.id,
                              days: 365,
                              idx: 4,
                              hex: '#7F9DFF',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 0),
                          child: TabBar(
                            onTap: (value) {},
                            indicatorColor: Colors.transparent,
                            indicator: const BoxDecoration(
                              color: Color.fromRGBO(127, 157, 255, 0.7),
                            ),
                            unselectedLabelColor: Colors.white.withOpacity(0.4),
                            splashFactory: NoSplash.splashFactory,
                            tabs: const [
                              Tab(
                                text: '24H',
                              ),
                              Tab(
                                text: '7D',
                              ),
                              Tab(
                                text: '1M',
                              ),
                              Tab(
                                text: '3M',
                              ),
                              Tab(
                                text: '1Y',
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: StatefulBuilder(
                  builder: (context, setTState) {
                    return DefaultTabController(
                      length: 3,
                      child: Container(
                        width: double.infinity,
                        height: containerHeight,
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TabBar(
                              indicatorColor: Colors.transparent,
                              labelColor: const Color.fromRGBO(127, 157, 255, 1),
                              unselectedLabelColor: Colors.white.withOpacity(0.8),
                              splashFactory: NoSplash.splashFactory,
                              onTap: (value) {
                                setTState(
                                  () {
                                    containerHeight = value == 0 ? 1200 : 800;
                                  },
                                );
                              },
                              tabs: const [
                                Tab(
                                  child: Text(
                                    'About',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'News',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    'Exchanges',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Color.fromRGBO(127, 157, 255, 0.3),
                              thickness: 2,
                            ),
                            Flexible(
                              child: TabBarView(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        CoinDesc(desc: desc),
                                        Flexible(
                                          flex: 2,
                                          child: Card(
                                            elevation: 20,
                                            child: Container(
                                              margin: const EdgeInsets.only(top: 30),
                                              padding: const EdgeInsets.only(
                                                top: 20,
                                                left: 15,
                                                right: 15,
                                                bottom: 20,
                                              ),
                                              color: Colors.deepPurple.withOpacity(0.2),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          child: Text(
                                                            'Market Cap Rank',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.grey.withOpacity(1),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            info!.market_cap_rank.toString(),
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.deepPurple.withOpacity(1),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                              'Market Cap',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.grey.withOpacity(1),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            '\$${price(info!.market_cap.usd)}',
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.deepPurple.withOpacity(1),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                              child: Text(
                                                            'Fully Diluted Valuation',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.grey.withOpacity(1),
                                                            ),
                                                          )),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            '\$${price(info!.fully_diluted_valuation.usd)}',
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.deepPurple.withOpacity(1),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                              '24H High',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.grey.withOpacity(1),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            '\$${price(info!.high_24h.usd)}',
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.deepPurple.withOpacity(1),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                              '24H Low',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.grey.withOpacity(1),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            '\$${price(info!.low_24h.usd)}',
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.deepPurple.withOpacity(1),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                              child: Text(
                                                            'Total Supply',
                                                            style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors.grey.withOpacity(1),
                                                            ),
                                                          )),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            '\$${price(info!.total_supply)}',
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.deepPurple.withOpacity(1),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            child: Text(
                                                              'Max Supply',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors.grey.withOpacity(1),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          child: Text(
                                                            info!.max_supply.toString(),
                                                            style: const TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: InfoCard(social: social, date: date),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CoinNews(sNews: sNews),
                                  Container(
                                    //height: double.infinity,
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'EXC',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'PAIR',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'PRICE',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '24HVOL',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'TRUST',
                                                  style: Theme.of(context).textTheme.titleSmall,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.white,
                                        ),
                                        Expanded(
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  FlutterWebBrowser.openWebPage(url: exch![index].trade_url);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          exch![index].market.name,
                                                          style: const TextStyle(fontSize: 12),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              child: Text(
                                                                exch![index].base,
                                                                style: const TextStyle(fontSize: 12),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              child: Text(
                                                                exch![index].target,
                                                                style: const TextStyle(fontSize: 12),
                                                                textAlign: TextAlign.center,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          exch![index].converted_last.usd.toStringAsFixed(1),
                                                          style: const TextStyle(fontSize: 12),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          exch![index].converted_volume.usd.toStringAsFixed(1),
                                                          style: const TextStyle(fontSize: 12),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      const Expanded(
                                                        child: CircleAvatar(
                                                          backgroundColor: Colors.white,
                                                          radius: 5,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: 50,
                                            separatorBuilder: (context, index) {
                                              return const Divider(
                                                color: Color.fromRGBO(127, 157, 255, 1),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CoinNews extends StatelessWidget {
  const CoinNews({
    super.key,
    required this.sNews,
  });

  final List<Article>? sNews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.deepPurple.withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 0.9],
              ),
              border: Border.all(
                color: Colors.deepPurple.withOpacity(0.3),
                width: 3,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: InkWell(
              onTap: () {
                FlutterWebBrowser.openWebPage(url: sNews![index].url);
              },
              child: Card(
                margin: EdgeInsets.zero,
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.network(
                        sNews![index].urlToImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              sNews![index].title,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

class CoinDesc extends StatelessWidget {
  const CoinDesc({
    super.key,
    required this.desc,
  });

  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Text(
      desc!,
      maxLines: 11,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.social,
    required this.date,
  });

  final Link? social;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.deepPurple.withOpacity(0.2),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 25),
        margin: const EdgeInsets.only(top: 10, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    'HomePage',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.withOpacity(1),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: social!.homepage.where((element) => element != '').map(
                        (e) {
                          return InkWell(
                            child: e.isNotEmpty
                                ? Text(
                                    e,
                                    style: const TextStyle(fontSize: 13),
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.end,
                                  )
                                : const Text('-'),
                            onTap: () {
                              FlutterWebBrowser.openWebPage(url: e);
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    'Blockchain/Supply',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.withOpacity(1),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: social!.blockchain_site.where((element) => element != '').map((e) {
                        return InkWell(
                          child: e.isNotEmpty
                              ? Text(
                                  e,
                                  style: const TextStyle(fontSize: 13),
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : const Text('-'),
                          onTap: () {
                            FlutterWebBrowser.openWebPage(url: e);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    'Discussion Forum',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.withOpacity(1),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: social!.official_forum_url.where((element) => element != '').map((e) {
                        return InkWell(
                          onTap: () {
                            FlutterWebBrowser.openWebPage(url: e);
                          },
                          child: e.isNotEmpty
                              ? Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : const Text('-'),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    'Genesis Date',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.withOpacity(1),
                    ),
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    child: date != ''
                        ? Text(
                            date!,
                            style: const TextStyle(fontSize: 13),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          )
                        : const Text('-'),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        child: Text(
                          'Reddit',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.withOpacity(1),
                          ),
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                SizedBox(
                  child: InkWell(
                    child: social!.subreddit_url != ''
                        ? Text(
                            social!.subreddit_url,
                            style: const TextStyle(fontSize: 13),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          )
                        : const Text('-'),
                    onTap: () {
                      FlutterWebBrowser.openWebPage(url: social!.subreddit_url);
                    },
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.deepPurple,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SizedBox(
                    child: Row(
                      children: [
                        SizedBox(
                          child: Text(
                            'Github',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.withOpacity(1),
                            ),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: social!.repos_url.github.where((element) => element != '').map(
                        (e) {
                          return InkWell(
                            child: e.isNotEmpty
                                ? Text(
                                    e,
                                    style: const TextStyle(fontSize: 13),
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const Text('-'),
                            onTap: () {
                              FlutterWebBrowser.openWebPage(url: e);
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
