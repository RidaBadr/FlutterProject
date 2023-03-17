import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:miaged/Authentification/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginForm()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Image.network(
                          'https://i.postimg.cc/nLnC8FSD/MIAGED.png)',
                          width: 65.0,
                          height: 65.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      const Text(
                        "MIAGED",
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitFoldingCube(
                      color: Theme.of(context).primaryColorLight,
                      size: 35.0,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'MIAGE INTENSE - LOADING ...',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
