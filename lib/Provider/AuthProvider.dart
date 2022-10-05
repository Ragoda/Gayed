import 'dart:convert';

import 'package:Gayd/Component/utilsConst.dart';
import 'package:Gayd/Screen/Login/login.dart';
import 'package:Gayd/Screen/tabbar.dart';
import 'package:Gayd/Utile/AppUrl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  Future<Map<String, dynamic>> Registration(
    context,
    FirstName,
    LastName,
    phone,
    email,
    id,
  ) async {
    SharedPreferences nameLogin;
    var result;
    SharedPreferences phoneLogin;

    SharedPreferences logindata;
    final bodyData = jsonEncode({
      "first_name": "$FirstName",
      "last_name": "$LastName",
      "phone": "$phone",
      "email": "$email",
      "device_name": "$id",
    });
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    String url = AppUrl.register;
    print(url);
    final response = await http
        .post(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': "Bearer " + token,
            },
            body: bodyData)
        .then((response) async {
      print('Response status :${response.statusCode}');

      print('Response body :${response.body}');

      var data = jsonDecode(response.body);

      print(data["Stutus"]);

      if (response.statusCode == 200 && data["status"] != false) {
        logindata = await SharedPreferences.getInstance();
        logindata.clear();
        String token = data["token"];
        var name = data["Data"]['first_name'];
        var last_name = data["Data"]['last_name'];
        var EmailLogin = data["Data"]['email'];
        var phoneNum = data["Data"]['phone'];
        logindata.setBool('login', true);

        logindata.setBool('isLogin', true);
        logindata.setString('token', token);
        logindata.setString('name', name);
        logindata.setString('last_name', last_name);
        logindata.setString('phone', phoneNum);
        logindata.setString('email', EmailLogin);
        logindata.setString('phone_id', id.toString());
        print(token);
        print(name);
        print(last_name);
        print(phoneNum.toString());
        print(EmailLogin);
        print(id);
        print(logindata.getBool("isLogin"));

        Constant.Token = "Bearer " + token;
        print('this is contat ${Constant.Token}');

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Tabarr()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["errors"].toString())));

        result = {
          'status': false,
        };
        return result;
      }
    });
    return result;
  }

  Future<Map<String, dynamic>> login(
    context,
    phone,
    id,
  ) async {
    SharedPreferences nameLogin;
    var result;
    SharedPreferences phoneLogin;

    SharedPreferences logindata;
    final bodyData = jsonEncode({
      "phone": "$phone",
      "device_name": "$id",
    });

    String url = AppUrl.login;
    print(url);
    final response = await http
        .post(Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
            },
            body: bodyData)
        .then((response) async {
      print('Response status :${response.statusCode}');

      print('Response body :${response.body}');
      var data = jsonDecode(response.body);

      print(data["Stutus"]);

      if (response.statusCode == 200 && data["Stutus"] != false) {
        var data = jsonDecode(response.body);

        logindata = await SharedPreferences.getInstance();
        logindata.clear();
        String token = data["token"];
        var name = data["Data"]['first_name'];
        var last_name = data["Data"]['last_name'];
        var EmailLogin = data["Data"]['email'];
        var phoneNum = data["Data"]['phone'];
        logindata.setBool('login', true);
        logindata.setBool('isLogin', true);
        logindata.setString("reset_phone_token", token);
        logindata.setString('token', token);
        logindata.setString('name', name);
        logindata.setString('last_name', last_name);
        logindata.setString('phone', phoneNum);
        logindata.setString('email', EmailLogin);
        logindata.setString('phone_id', id.toString());
        print(token);
        print(name);
        print(last_name);
        print(phoneNum.toString());
        print(EmailLogin);
        print(id);
        print(logindata.getBool("isLogin"));

        Constant.Token = "Bearer " + token;
        print('this is contat ${Constant.Token}');

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Tabarr()));
        result = {
          'status': false,
        };
        return result;
      } else {
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(data["Message"]),
        ));
        result = {
          'status': false,
        };
        return result;
      }
    });
    return result;
  }

  otp_rest_phone(context) async {
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("reset_phone_token").toString();

    String url = AppUrl.otp;
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': "Bearer " + token,

      //Constant.Token
    });
    var data = jsonDecode(response.body);
    var result;
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));

      result = {
        'status': true,
      };
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ResetPhone()));
      return result;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"].toString())));
      result = {
        'status': false,
      };
      return result;
    }
  }

  Reset_Phone_num(
    BuildContext context,
    otpcode,
    phone,
  ) async {
    var dio = new Dio();
    var result;
    var formData = FormData.fromMap({
      'otp': otpcode,
      'phone': phone,
    });
    String url = AppUrl.resetPhone;
    print(url);
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("reset_phone_token").toString();
    print(token);
    var response = await dio
        .post("$url",
            data: formData,
            options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': "Bearer " + token,
              },
            ))
        .then((response) async {
      print('Response status :${response.statusCode}');

      print('Response body :${response.data}');
      var data = response.data;
      if (response.statusCode == 200 && data['status'] == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
        result = {
          'status': true,
        };
        return result;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"].toString())));
        result = {
          'status': false,
        };
        return result;
      }
    });
    return result;
  }

  profile_update(
    BuildContext context,
    String id,
    String name,
    String last_name,
    String email,
    String phone,
  ) async {
    var result;
    String url = AppUrl.profile_update;
    print(url);
    final response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': Constant.Token
    }, body: {
      'first_name': name,
      'last_name': last_name,
      'phone': phone,
      'email': email,
      'device_name': id
    }).then((response) async {
      print('Response status :${response.statusCode}');

      print('Response body :${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferences logindata;
        logindata = await SharedPreferences.getInstance();

        var name = data["Data"]['first_name'];
        var last_name = data["Data"]['last_name'];
        var EmailLogin = data["Data"]['email'];
        var phoneNum = data["Data"]['phone'];
        logindata.setBool('login', true);
        logindata.setBool('isLogin', true);

        logindata.setString('name', name);
        logindata.setString('last_name', last_name);
        logindata.setString('phone', phoneNum);
        logindata.setString('email', EmailLogin);
        logindata.setString('phone_id', id.toString());

        print(name);
        print(last_name);
        print(phoneNum.toString());
        print(EmailLogin);
        print(id);
        print(logindata.getBool("isLogin"));

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["stuts"])));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Tabarr()));
        result = {
          'status': true,
        };
        return result;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));
        result = {
          'status': false,
        };
        return result;
      }
    });
    return result;
  }

  Contact_Us(
    context,
    String name,
    String email,
    var phone,
    String detail,
  ) async {
    String url = AppUrl.contact_us;
    print(url);
    final response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Authorization': Constant.Token,
    }, body: {
      'name': name,
      'email': email,
      'details': detail,
      'phone': phone,
    }).then((response) async {
      print('Response status :${response.statusCode}');

      print('Response body :${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Tabarr()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));
        print(response.body);
      }
    });
  }

  Service_center(
    context,
    String name,
    String email,
    var phone,
    String detail,
  ) async {
    final Map<String, dynamic> all_data = {
      "lang": "En",
      'name': name,
      'email': email,
      'phone': phone,
      'description': detail,
    };
    print(all_data);
    String url = AppUrl.Service_center;
    print(url);
    final response = await http
        .post(Uri.parse(url),
            headers: {
              'Accept': 'application/json',
              "Content-Type": 'application/json',
              'Authorization': Constant.Token,
            },
            body: json.encode(all_data))
        .then((response) async {
      print('Response status :${response.statusCode}');

      print('Response body :${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Tabarr()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data["message"])));
        print(response.body);
      }
    });
  }
}
