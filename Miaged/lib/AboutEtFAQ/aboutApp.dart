import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A propos'),
        titleSpacing: 0.0,
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'MIAGED ',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'MIAGED is a multipurpose ecommerce app. MIAGED is built in flutter. Flutter is a Hybrid App Development Platform. So, MIAGED Compatible with Android and IOS both.',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'MIAGED is a developed by Badr RIDA.',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Thanks for Installing our App',
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Divider(
                  height: 1.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
