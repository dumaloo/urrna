import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: const Row(
                    children: <Widget>[
                      Icon(
                        Icons.local_shipping,
                        size: 24.0,
                      ),
                      Text(
                        'Shipping Details',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'First',
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Last',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Street',
                  ),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'City',
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'State',
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Zip',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade800),
                      ),
                      onPressed: () {
                        // Replace with your UPI ID and payment details
                        String upiUrl = "upi://pay?pa=yourupi@address&pn=PayeeName&am=100&cu=INR&url=https://example.com";

                        // Encode the UPI URL
                        String encodedUpiUrl = Uri.encodeFull(upiUrl);

                        // Launch the UPI payment app
                        launch(encodedUpiUrl).then((value) {
                          print("UPI app opened: $value");
                        }).catchError((error) {
                          print("Error opening UPI app: $error");
                        });
                      },
                      child: const Text('Purchase'),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}