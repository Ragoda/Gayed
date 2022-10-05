import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:Gayd/theme/style.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  bool _isSend = false;

  void showToastIsSend() {
    setState(() {
      _isSend = !_isSend;
    });
  }
  final int timerMaxSeconds = 60;
  final interval = const Duration(seconds: 1);
  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }
  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Material(
      child:  new Container(
          color: Colors.white,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Image.asset(
                    "assets/images/password.jpg",
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Form(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                            ),
                        /*    TextFormField(
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(Icons.phone,
                                        color: Colors.black, size: 20.0,),
                                    ),

                                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                                    hintText: getTranslated(context, "phone_number"),
                                    hintStyle: TextStyle(color: Colors.grey, fontFamily: "Cairo")
                                )
                            ),*/
                            SizedBox(height: 20,),
                         //   Text(getTranslated(context, "enter_phone"),style: TextStyle(fontFamily: "Cairo"),),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),

                        child: Column(
                          children: [
                            Text(getTranslated(context, "send_pass"),style: TextStyle(fontFamily: "Cairo"),),
                            SizedBox(height: 10,),
                            Row(children: [Text(getTranslated(context,    "get_message"),style: TextStyle(fontFamily: "Cairo"),),
                         SizedBox(width:6),
                            Text(getTranslated(context,    "send_after"),style: TextStyle(fontFamily: "Cairo"),),
                        ]),
                            SizedBox(height: 10,),
    Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    Icon(Icons.timer),
    SizedBox(
    width: 5,
    ),
    Text(timerText)
    ],
    ),],

                        ),


                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                    ),
                    ButtonTheme(
                      minWidth: screenSize.width * 0.83,
                      height: 45.0,
                      child: RaisedButton(
                          color: primaryColor,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                          elevation: 0.0,
                          child: new Text(
                            getTranslated(context, "re_send"),
                            style: headingWhite,
                          ),
                          onPressed: () {

                            showToastIsSend();
                          }),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),



                  ],
                ),
              ),

            ],
          )),
    );
  }
}
