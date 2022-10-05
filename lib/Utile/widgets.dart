import 'package:Gayd/Provider/Cart_provider.dart';
import 'package:Gayd/Screen/Home/Search.dart';
import 'package:Gayd/Screen/Login/login.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appBar(String name, Size size, BuildContext context,
    GlobalKey<ScaffoldState> scaffoldKey, bool? arrow_back,
    {bool? withoutCart}) {
  withoutCart == null ? withoutCart = false : withoutCart = true;
  arrow_back == null ? arrow_back = false : arrow_back = true;
  return Container(
    width: size.width,
    color: primaryColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 40),
              child: !withoutCart
                  ? Stack(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MylastCart()));
                          },
                        ),
                        (CartProvider().get_item_count() > 0)
                            ? Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        CartProvider()
                                            .get_item_count()
                                            .toString(),
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    )),
                              )
                            : Text("")
                      ],
                    )
                  : SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  icon: FaIcon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: arrow_back
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ))
                  : Text(""),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(
                fontSize: size.width / 23, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),
      ],
    ),
  );
}

// Widget changLang(context) {
//   void _changeLanguage(Language lang) async {
//     Locale _temp = await setLocale(lang.languageCode);
//     MyApp.setLocale(context, _temp);
//   }

//   String localcode = Localizations.localeOf(context).languageCode;

//   return localcode == "ar"
//       ? DropdownButton(
//           underline: SizedBox(),
//           hint: Text(
//             'العربية' + ' 🇸🇦',
//             style: TextStyle(color: Colors.white),
//           ),
//           items: Language.languageList()
//               .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
//                     value: lang,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         Text(
//                           lang.flag,
//                           style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
//                         ),
//                         Text(lang.name)
//                       ],
//                     ),
//                   ))
//               .toList(),
//           onChanged: (Language? lang) {
//             _changeLanguage(lang!);
//           },
//         )
//       : DropdownButton(
//           underline: SizedBox(),
//           hint:
//               Text('English' + ' 🇺🇸', style: TextStyle(color: Colors.white)),
//           items: Language.languageList()
//               .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
//                     value: lang,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         Text(
//                           lang.flag,
//                           style: TextStyle(fontSize: 20, fontFamily: "Cairo"),
//                         ),
//                         Text(lang.name)
//                       ],
//                     ),
//                   ))
//               .toList(),
//           onChanged: (Language? lang) {
//             print(lang);
//             _changeLanguage(lang!);
//           },
//         );
// }

isLogin(context, calssName) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? isloginn = storage.getString('token');
  print(isloginn.toString());
  if (isloginn == "" || isloginn != null) {
    calssName();
  } else {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      borderSide: BorderSide(color: primaryColor, width: 2),
      width: 500,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: "Not login",
      desc: "You Are Not Login Please Login NoW to Get Your Products",
      showCloseIcon: true,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
    )..show();
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
