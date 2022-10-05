import 'dart:async';
import 'package:Gayd/Screen/tabbar.dart';
import 'package:Gayd/Walkthrough/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool _seen = (prefs.getBool('seen') ?? false);

      if (_seen) {
        try {
          print("seen");
          SharedPreferences storage = await SharedPreferences.getInstance();

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Tabarr()));
        } catch (e) {
          print(e);
        }
      } else {
        await prefs.setBool('seen', true);
        print("not seen");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WalkthroughScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey[900],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Image.asset("asset/logo.jpg"),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
