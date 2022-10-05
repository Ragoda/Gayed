import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:flutter/material.dart';


class Validations {
  String? validateName(BuildContext context, String value) {
    if (value.isEmpty) return getTranslated(context, "enter_name");
    // final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    // if (!nameExp.hasMatch(value))
    //   return "الاسم غير صحيح";
    return null;
  }

  String? validatebankName(BuildContext context, String value) {
    if (value.isEmpty) return getTranslated(context, "enter_bankname");
    // final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    // if (!nameExp.hasMatch(value))
    //   return "الاسم غير صحيح";
    return null;
  }

  String? validateaddress(BuildContext context, String value) {
    if (value.isEmpty) return getTranslated(context, "enter_address");
    // final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
    // if (!nameExp.hasMatch(value))
    //   return "الاسم غير صحيح";
    return null;
  }

  String? validatePrice(BuildContext context, String value) {
    if (value.isEmpty) return getTranslated(context, "enter_price");
    return null;
  }

  String?validateaccountnumber(BuildContext context, String value) {
    if (value.isEmpty) return getTranslated(context, "enter_accountnumber");
    return null;
  }

  String ?validate_bank_iban(BuildContext context, String value) {
    if (value.isEmpty) return getTranslated(context, "enter_iban");
    return null;
  }

  String? validateEmail(BuildContext context, String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return getTranslated(context, "validateEmail");
    else
      return null;
  }

  String? validatePassword(BuildContext context, String value) {
    if (value.isEmpty) {
      return getTranslated(context, "validatePasswordEmpty");
      // Constants.alertsDialogs(
      //     context: context, title: "من فضلك ادخل كلمة المرور ");
    }

    if (value.length < 8)
      return getTranslated(context, "validatePassword");
    // return ' يجب ان يتم ادخال 8 ارقام علي الاقل ';

    else
      return null;
  }

  // String validatePassword(BuildContext context,String value) {
  //   if (value.isEmpty && value.length != 8) return getTranslated(context, "validatePassword");
  //   return null;
  // }

  String? validateMobile(BuildContext context, String value) {
    if (value.length != 10)
      return getTranslated(context, "wrong_phone");
    else
      return null;
  }
}
