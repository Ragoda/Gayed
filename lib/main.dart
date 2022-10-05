import 'dart:io';

import 'package:Gayd/app_localization/localization/set_localization.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'SplashScreen/splashscreen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localization/localization/localization_methods.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getDir() async {
    Directory appdocumentDir =
        await pathProvider.getApplicationDocumentsDirectory();
    print(appdocumentDir);
    if (appdocumentDir != null) Hive.init(appdocumentDir.path);
    // await Hive.deleteBoxFromDisk('shopping_box');
    await Hive.openBox('shopping_box');
  }

  late Locale _local;

  void setLocale(Locale locale) {
    setState(() {
      _local = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._local = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getDir();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
        designSize: Size(360, 690),
        allowFontScaling: false,
        builder: () {
          return MaterialApp(
              title: 'قايض',
              theme: appTheme,
              locale: _local,
              home: new SplashScreen(),
              debugShowCheckedModeBanner: false,
              supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
              localizationsDelegates: [
                SetLocalization.localizationsDelegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocal, supportedLocales) {
                for (var local in supportedLocales) {
                  if (local.languageCode == deviceLocal!.languageCode &&
                      local.countryCode == deviceLocal.countryCode) {
                    return deviceLocal;
                  }
                }
                return supportedLocales.last;
              });
        });
  }
}
