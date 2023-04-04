import 'package:cryptoapp/coin/coinscreen.dart';
import 'package:cryptoapp/service/models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoinListing extends StatelessWidget {
  const CoinListing({
    super.key,
    required this.cryptoData,
    required this.itemCount,
  });

  final List<Latestcrypto> cryptoData;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, count) {
        return Card(
          elevation: 10,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return CoinScreen(
                      id: cryptoData[count].id,
                      name: cryptoData[count].name,
                      sym: cryptoData[count].symbol,
                      price: cryptoData[count].current_price,
                      img: cryptoData[count].image,
                      per: cryptoData[count].price_change_percentage_24h,
                    );
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 30,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.deepPurple.withOpacity(0.25),
                  width: 2.5,
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.deepPurple.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
                    0.2,
                    0.9,
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.network(cryptoData[count].image),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cryptoData[count].name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(cryptoData[count].symbol, style: Theme.of(context).textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: Container(
                  //     height: 50,
                  //     margin: const EdgeInsets.only(left: 15, right: 5),
                  //     child: ChartWidget(
                  //       id: cryptoData[count].id,
                  //       days: 1,
                  //       idx: 0,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${cryptoData[count].current_price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                cryptoData[count].price_change_percentage_24h > 0
                                    ? Icon(
                                        FontAwesomeIcons.arrowUp,
                                        size: 8,
                                        color: Colors.lightBlue[400],
                                      )
                                    : Icon(
                                        FontAwesomeIcons.arrowDown,
                                        size: 8,
                                        color: Colors.red[400],
                                      ),
                                Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  child: Text(
                                    '${cryptoData[count].price_change_percentage_24h.abs().toStringAsFixed(2)}%',
                                    style: cryptoData[count].price_change_percentage_24h > 0
                                        ? TextStyle(
                                            color: Colors.lightBlue[400],
                                            fontSize: 14,
                                          )
                                        : TextStyle(
                                            color: Colors.red[400],
                                            fontSize: 14,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: itemCount,
    );
  }
}
