import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';


class Constant{
pref() async{
  SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString('token');}
 
  static String BoxName="cart";
  static String Token="";
  static  bool isLogin=false;
  static String  orderId="";

}



double roundDecimal(double val, int places){
  num mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}