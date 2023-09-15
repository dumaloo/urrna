import 'package:flutter/material.dart';

class WoolNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wool Price App',
      home: PriceListScreen(),
    );
  }
}

class PriceListScreen extends StatelessWidget {
  // Define your dataset here
  final List<Map<String, dynamic>> woolData = [
    {"Date": "2023-05-31", "Value": 897.67},
    {"Date": "2023-04-30", "Value": 903.33},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: woolData.length,
        itemBuilder: (context, index) {
          final date = woolData[index]["Date"];
          final price = woolData[index]["Value"];

          return ListTile(
            title: Text('Date: $date'),
            subtitle: Text('Price: $price US cents per kilogram'),
          );
        },
      ),
    );
  }
}
