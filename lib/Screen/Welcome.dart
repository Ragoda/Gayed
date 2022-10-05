import 'package:Gayd/Screen/tabbar.dart';
import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:Gayd/app_localization/models/language.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'Login/login.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void _changeLanguage(Language lang) async {
    Locale _temp = await setLocale(lang.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    String localcode = Localizations.localeOf(context).languageCode;
    final screenSize = MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Container(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 4, left: 10),
              child: localcode == "ar"
                  ? DropdownButton(
                      underline: SizedBox(),
                      hint: Text(
                        'العربية' + ' 🇸🇦',
                        style: TextStyle(color: Colors.white),
                      ),
                      items: Language.languageList()
                          .map<DropdownMenuItem<Language>>(
                              (lang) => DropdownMenuItem(
                                    value: lang,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          lang.flag,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Cairo"),
                                        ),
                                        Text(lang.name)
                                      ],
                                    ),
                                  ))
                          .toList(),
                      onChanged: (Language? lang) {
                        _changeLanguage(lang!);
                      },
                    )
                  : DropdownButton(
                      underline: SizedBox(),
                      hint: Text('English' + ' 🇺🇸',
                          style: TextStyle(color: Colors.white)),
                      items: Language.languageList()
                          .map<DropdownMenuItem<Language>>(
                              (lang) => DropdownMenuItem(
                                    value: lang,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          lang.flag,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Cairo"),
                                        ),
                                        Text(lang.name)
                                      ],
                                    ),
                                  ))
                          .toList(),
                      onChanged: (Language? lang) {
                        _changeLanguage(lang!);
                      },
                    ),
            )
          ],
        ),
        body: new SingleChildScrollView(
            // color: Colors.white,
            child: new Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: screenSize.height / 3.9,
                  //   child: Image.asset(
                  // "assets/images/welcome.JPG",
                  // fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: screenSize.width * 0.83,
                      height: 45.0,
                      child: RaisedButton(
                          color: primaryColor,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                          elevation: 0.0,
                          child: new Text(
                            getTranslated(context, "login"),
                            style: headingWhite,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                            // Navigator.pushNamed(context, '/login');
                          }),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonTheme(
                      minWidth: screenSize.width * 0.83,
                      height: 45.0,
                      child: RaisedButton(
                        color: Colors.white,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            side: BorderSide(color: primaryColor, width: 2)),
                        elevation: 0.0,
                        child: new Text(
                          getTranslated(context, "create_account"),
                          style: headingBlack,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Tabarr()));

                        //   Navigator.pushNamed(context, '/home');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.orange,
                          ),
                          Text(
                            getTranslated(context, "guest"),
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.orange,
                                fontFamily: "Cairo"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
