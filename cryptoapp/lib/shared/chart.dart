import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatefulWidget {
  final String id;
  final int days;
  final int idx;
  final String hex;

  const ChartWidget({Key? key, required this.id, required this.days, required this.idx, required this.hex}) : super(key: key);

  static final Map<String, List<List<ChartData>>> datacache = {};

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  List<ChartData>? chartData;

  @override
  void initState() {
    super.initState();

    if (ChartWidget.datacache[widget.id] == null) {
      ChartWidget.datacache[widget.id] = [];
    }

    if (ChartWidget.datacache[widget.id]!.length <= widget.idx) {
      ChartWidget.datacache[widget.id]!.add([]);
    }

    if (ChartWidget.datacache[widget.id]![widget.idx].isNotEmpty) {
      chartData = ChartWidget.datacache[widget.id]![widget.idx];
    } else {
      get24hChart(widget.id, widget.days).then((data) {
        setState(() {
          chartData = data;
          ChartWidget.datacache[widget.id]![widget.idx] = data;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (chartData != null) {
      var minValue = chartData!.map((e) => e.price).reduce((value, element) => value < element ? value : element);
      var maxValue = chartData!.map((e) => e.price).reduce((a, b) => a > b ? a : b);

      List<charts.Series<ChartData, DateTime>> seriesList = [
        charts.Series<ChartData, DateTime>(
          id: 'Price',
          colorFn: (_, __) => charts.Color.fromHex(code: widget.hex),
          domainFn: (ChartData price, _) => price.timestamp,
          measureFn: (ChartData price, _) => price.price,
          data: chartData!,
        ),
      ];
      return InteractiveViewer(
        child: charts.TimeSeriesChart(
          seriesList,
          animate: true,
          layoutConfig: charts.LayoutConfig(
            leftMarginSpec: charts.MarginSpec.fixedPixel(0),
            topMarginSpec: charts.MarginSpec.fixedPixel(0),
            rightMarginSpec: charts.MarginSpec.fixedPixel(0),
            bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
          ),
          defaultRenderer: charts.LineRendererConfig(
            includePoints: false,
            includeArea: true,
            stacked: false,
          ),
          //behaviors: [charts.PanAndZoomBehavior()],
          defaultInteractions: true,
          primaryMeasureAxis: charts.NumericAxisSpec(
            viewport: charts.NumericExtents(minValue, maxValue),
            renderSpec: const charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(fontSize: 18),
            ),
          ),
          domainAxis: charts.DateTimeAxisSpec(
            renderSpec: const charts.NoneRenderSpec(),
            viewport: charts.DateTimeExtents(
              end: DateTime.now(),
              start: DateTime.now().subtract(
                Duration(days: widget.days),
              ),
            ),
          ),
          dateTimeFactory: const charts.LocalDateTimeFactory(),
          // Set the y-axis to the adjusted range
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}

class ChartData {
  final DateTime timestamp;
  final double price;

  ChartData({required this.timestamp, required this.price});

  factory ChartData.fromList(List<dynamic> list) {
    return ChartData(
      timestamp: DateTime.fromMillisecondsSinceEpoch(list[0]),
      price: list[1],
    );
  }
}

// Coin History API.
Future<List<ChartData>> get24hChart(id, day) async {
  var response = await get(Uri.parse('https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=usd&days=$day'));
  if (response.statusCode == 200) {
    print('Call 1');
    var jsonData = jsonDecode(response.body);
    List<dynamic> prices = jsonData['prices'];
    var pList = prices.map((e) => ChartData.fromList(e)).toList();
    return pList;
  } else {
    throw Exception('Failed to Load Data');
  }
}
