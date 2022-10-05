// import 'dart:async';
// import 'dart:convert';
// import 'package:Gayd/Model/notificatio.dart';
// import 'package:Gayd/Utile/AppUrl.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// class Notifications_provider extends ChangeNotifier {
  

//   Future<Notifications> my_Notifications() async {
//     SharedPreferences getData = await SharedPreferences.getInstance();

//     var token = getData.getString("token");

//     print(token);
//     var respons = await http.get(
//       AppUrl.Notifications,
//       headers: {






  
//         "Authorization": "Bearer $token",
//       },
//     );

//     if (respons.statusCode == 200 || respons.statusCode == 201) {
//       final data = json.decode(respons.body)["data"]["data"];
//       print(data);

//       return Notifications.fromJson(json.decode(respons.body));
//     } else {
//       print(respons.body);
//     }
//   }
// }