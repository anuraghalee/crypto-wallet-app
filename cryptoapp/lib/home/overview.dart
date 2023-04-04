import 'package:cryptoapp/service/models.dart';
import 'package:cryptoapp/shared/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart' as style;

class Overview extends StatefulWidget {
  final List<Latestcrypto> cryptoList;
  const Overview({super.key, required this.cryptoList});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with SingleTickerProviderStateMixin {
  late AnimationController cont;
  late Animation anim;
  bool showText = false;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    cont = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(
        milliseconds: 1200,
      ),
    );
    anim = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: cont,
        curve: Curves.easeInOutExpo,
      ),
    )..addListener(() {
        setState(() {
          showText = anim.value >= 1;
          isExpanded = anim.value == 1;
        });
      });
    cont.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: anim,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: anim.value,
          child: AnimatedContainer(
            duration: const Duration(microseconds: 700),
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            color: Colors.black,
            height: anim.value,
            child: ListView(
              children: [
                Container(
                  // duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: (150 * anim.value).toDouble(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showText
                          ? Flexible(
                              child: Text(
                                'TOTAL BALANCE',
                                style: style.TextStyle(
                                  fontFamily: 'Brit',
                                  fontSize: 40,
                                  letterSpacing: 1.5,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            )
                          : const Flexible(child: Text('')),
                      showText
                          ? const Flexible(
                              child: Text(
                                '\$124,000.00',
                                style: style.TextStyle(
                                  fontFamily: 'Brit',
                                  fontSize: 40,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            )
                          : const Flexible(child: Text('')),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  // padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: (150 * anim.value).toDouble(),
                  child: SizedBox(
                    child: Center(
                      child: showText
                          ? const Text(
                              'ASSET DISTRIBUTION',
                              style: TextStyle(
                                fontFamily: 'Brit',
                                fontSize: 30,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 10),
                  height: (100 * anim.value).toDouble(),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: showText
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'BUY',
                              style: style.TextStyle(
                                color: Colors.black,
                                fontFamily: 'Brit',
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                print('Button Pressed.');
                              },
                              child: const Icon(
                                Icons.arrow_outward,
                                color: Colors.black,
                                size: 50,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Opacity(
                            opacity: showText ? 1 : 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'SWAP',
                                  style: style.TextStyle(
                                    fontFamily: 'Brit',
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.swap_horiz,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Opacity(
                            opacity: showText ? 1 : 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'SELL',
                                  style: style.TextStyle(
                                    fontSize: 30,
                                    fontFamily: 'Brit',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.sell_sharp,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  margin: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber,
                          // border: Border.all(
                          //   color: Colors.white,
                          //   width: 4,
                          // ),
                        ),
                        width: 200,
                        child: showText
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.cryptoList[index].name.toUpperCase(),
                                        style: const style.TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Brit',
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        widget.cryptoList[index].symbol.toUpperCase(),
                                        style: const style.TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Brit',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: double.infinity,
                                    height: 50,
                                    child: const ChartWidget(
                                      id: 'bitcoin',
                                      days: 1,
                                      idx: 0,
                                      hex: '#0A0A0A',
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '\$${widget.cryptoList[index].current_price.toStringAsFixed(2)}',
                                              style: const style.TextStyle(
                                                color: Colors.black,
                                                fontSize: 30,
                                                fontFamily: 'Brit',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              color: widget.cryptoList[index].price_change_percentage_24h > 0 ? Colors.green : Colors.red,
                                              child: Text(
                                                '${widget.cryptoList[index].price_change_percentage_24h.toString()} %',
                                                style: const style.TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'Brit',
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                      );
                    },
                    itemCount: 7,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      showText
                          ? const Text(
                              'Recent Activity',
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Brit',
                              ),
                            )
                          : const SizedBox.shrink(),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: (100 * anim.value).toDouble(),
                              // width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: showText
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'BITCOIN',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'Brit',
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text('\$128',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Brit',
                                              color: Colors.black.withOpacity(0.6),
                                            ))
                                      ],
                                    )
                                  : SizedBox.shrink(),
                            );
                          },
                          itemCount: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
