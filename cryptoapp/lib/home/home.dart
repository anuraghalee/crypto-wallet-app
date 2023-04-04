import 'dart:async';

import 'package:cryptoapp/auth.dart';
import 'package:cryptoapp/home/coinlisting.dart';
import 'package:cryptoapp/home/overview.dart';
import 'package:cryptoapp/service/api.dart';
import 'package:cryptoapp/service/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static List<Latestcrypto> datacache1 = [];
  static List<Article> datacache2 = [];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late List<Latestcrypto> cryptoData;
  late List<Article> newsData;
  late TabController tabcont;
  int itemCount = 10;

  @override
  void initState() {
    super.initState();

    tabcont = TabController(length: 3, vsync: this);
    Timer(const Duration(minutes: 1), () {
      setState(() {
        print('SET');
        if (itemCount == 10) {
          itemCount += 10;
        } else {
          itemCount = 10;
        }
      });
    });

    if (HomeScreen.datacache1.isEmpty) {
      API().getList().then((value) {
        setState(() {
          cryptoData = value;
          HomeScreen.datacache1 = cryptoData;
        });
      });
    } else {
      cryptoData = HomeScreen.datacache1;
    }

    if (HomeScreen.datacache2.isEmpty) {
      API().getArticles().then((value) {
        setState(() {
          newsData = value;
          HomeScreen.datacache2 = newsData;
        });
      });
    } else {
      newsData = HomeScreen.datacache2;
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = AuthState().userCurrent;
    var name = user!.isAnonymous ? 'Guest' : user.displayName;
    var currInd = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leadingWidth: 40,
        leading: name == 'Guest'
            ? const Icon(FontAwesomeIcons.user)
            : ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    // color: Colors.red,
                  ),
                  child: Image.network(user.photoURL!),
                ),
              ),
        title: Text('Hello, $name'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
            onPressed: () async {
              await AuthState().signOut();
              await GoogleSignIn().signOut();
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TabBarView(
                  controller: tabcont,
                  children: [
                    Overview(
                      cryptoList: cryptoData,
                    ),
                    CoinListing(cryptoData: cryptoData, itemCount: itemCount),
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () async {
                              var lurl = newsData[index].url;
                              FlutterWebBrowser.openWebPage(
                                url: lurl,
                                safariVCOptions: const SafariViewControllerOptions(),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepPurple.withOpacity(0.2),
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.deepPurple.withOpacity(0.2),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  stops: const [0.3, 1],
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                      child: Opacity(
                                        opacity: 0.6,
                                        child: Image.network(
                                          newsData[index].urlToImage,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          newsData[index].title,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white.withOpacity(0.8),
                                            fontWeight: FontWeight.w300,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: StatefulBuilder(
        builder: (context, setBState) {
          tabcont.addListener(
            () {
              if (!tabcont.indexIsChanging) {
                setBState(
                  () {
                    currInd = tabcont.index;
                  },
                );
              }
            },
          );
          return Container(
            margin: const EdgeInsets.only(
              bottom: 20,
              left: 15,
              right: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromRGBO(231, 197, 242, 1),
              ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
            ),
            height: 70,
            child: TabBar(
              controller: tabcont,
              isScrollable: false,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.transparent,
              labelColor: const Color.fromRGBO(127, 157, 255, 1),
              labelPadding: EdgeInsets.zero,
              splashFactory: NoSplash.splashFactory,
              tabs: [
                AnimatedContainer(
                  padding: const EdgeInsets.only(left: 5),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutQuart,
                  width: currInd == 0 ? 110 : 20,
                  height: 40,
                  color: currInd == 0 ? const Color.fromRGBO(231, 197, 242, 1) : Colors.black,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: IconTheme(
                          data: const IconThemeData(size: 20),
                          child: Icon(
                            FontAwesomeIcons.house,
                            color: currInd == 0 ? Colors.black : const Color.fromRGBO(231, 197, 242, 1),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          currInd == 0 ? 'Overview' : '',
                          style: TextStyle(
                            fontSize: 14,
                            color: currInd == 0 ? Colors.black : Color.fromRGBO(231, 197, 242, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  padding: const EdgeInsets.only(left: 5),
                  duration: const Duration(milliseconds: 300),
                  width: currInd == 1 ? 110 : 20,
                  height: 40,
                  curve: Curves.easeInQuart,
                  color: currInd == 1 ? const Color.fromRGBO(231, 197, 242, 1) : Colors.black,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: IconTheme(
                          data: const IconThemeData(size: 20),
                          child: Icon(
                            FontAwesomeIcons.list,
                            color: currInd == 1 ? Colors.black : const Color.fromRGBO(231, 197, 242, 1),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          currInd == 1 ? 'Listings' : '',
                          style: TextStyle(
                            fontSize: 14,
                            color: currInd == 1 ? Colors.black : const Color.fromRGBO(231, 197, 242, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  padding: const EdgeInsets.only(left: 5),
                  duration: const Duration(milliseconds: 300),
                  width: currInd == 2 ? 110 : 20,
                  height: 40,
                  curve: Curves.easeInQuart,
                  color: currInd == 2 ? const Color.fromRGBO(231, 197, 242, 1) : Colors.black,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: IconTheme(
                          data: const IconThemeData(size: 20),
                          child: Icon(
                            FontAwesomeIcons.newspaper,
                            color: currInd == 2 ? Colors.black : const Color.fromRGBO(231, 197, 242, 1),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          currInd == 2 ? 'News' : '',
                          style: TextStyle(
                            fontSize: 14,
                            color: currInd == 2 ? Colors.black : const Color.fromRGBO(231, 197, 242, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
