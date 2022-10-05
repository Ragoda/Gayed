import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  bool _isSend = false;

  void showToastIsSend() {
    setState(() {
      _isSend = !_isSend;
    });
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
                            Text(getTranslated(context, "enter_phone"),style: TextStyle(fontFamily: "Cairo"),),

                            TextFormField(
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
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
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
                            getTranslated(context, "send"),
                            style: headingWhite,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/newPass');

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
