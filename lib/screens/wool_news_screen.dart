import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WoolNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wool Price App',
      home: PriceListScreen(
        woolData: const [
          {
            "Date": "2023-05-31",
            "Value": 897.67,
          },
          {
            "Date": "2023-04-30",
            "Value": 903.33,
          },
          {
            "Date": "2023-03-31",
            "Value": 902.30,
          },
          {
            "Date": "2023-02-28",
            "Value": 949.86,
          },
          {
            "Date": "2023-01-31",
            "Value": 919.37,
          },
          {
            "Date": "2022-12-31",
            "Value": 838.84,
          },
          {
            "Date": "2022-11-30",
            "Value": 789.78,
          },
          {
            "Date": "2022-10-31",
            "Value": 786.07,
          },
          {
            "Date": "2022-09-30",
            "Value": 819.34,
          },
          {
            "Date": "2022-08-31",
            "Value": 864.30,
          },
          {
            "Date": "2022-07-31",
            "Value": 900.97,
          },
          {
            "Date": "2022-06-30",
            "Value": 949.00,
          },
          {
            "Date": "2022-05-31",
            "Value": 917.33,
          },
          // Add more data here...
        ],
      ),
    );
  }
}

class PriceListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> woolData;

  PriceListScreen({required this.woolData});

  @override
  Widget build(BuildContext context) {
    // Extract dates and prices from the woolData
    final List<String> dates =
        woolData.map((data) => data["Date"].toString()).toList();
    final List<double> prices =
        woolData.map((data) => data["Value"] as double).toList();

    // Calculate the current price (latest entry)
    final double currentPrice = prices.isNotEmpty ? prices.last : 0.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Wool Price Chart',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8), // Add some spacing
            const Text(
              'Current Price: 897.67', // Format the price as desired ${currentPrice.toStringAsFixed(2)}
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            // SizedBox(height: 8), // Add some spacing
            // Text(
            //   'Description: Your description here', // Add your description
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 16), // Add more spacing
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  labelRotation: -45, // Rotate x-axis labels
                ),
                primaryYAxis: NumericAxis(),
                series: <ChartSeries>[
                  BarSeries<Map<String, dynamic>, String>(
                    dataSource: woolData,
                    xValueMapper: (data, _) => data["Date"].toString(),
                    yValueMapper: (data, _) => data["Value"] as double,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.top,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
