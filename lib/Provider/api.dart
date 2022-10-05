import 'dart:convert';

import 'package:Gayd/Model/SupCategoryModel.dart';
import 'package:Gayd/Model/categModel.dart';
import 'package:Gayd/Utile/AppUrl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CatogaryApi {
  // Future<ImageSlider?> getimage() async {
  //   String url = AppUrl.sliderimage;
  //   final response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'applicaton/json',
  //   });

  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     return ImageSlider.fromJson(jsonData);
  //   } else {
  //     print(response.body);
  //   }
  // }

  // Future<VideoModel?> getvideo() async {
  //   String url = AppUrl.videos;
  //   print(url);
  //   final response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'applicaton/json',
  //   });
  //   bool first_time = true;
  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body)["data"];
  //     print(jsonData);
  //     return VideoModel.fromJson(jsonData);
  //     first_time = false;
  //   } else {
  //     print(response.body);
  //   }
  // }

  Future<Categoryy?> getCategories() async {
    String url = AppUrl.category;
    print(url);
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'applicaton/json',
      'Authorization': "Bearer " + token,
    });
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return Categoryy.fromJson(jsonData);
    } else {
      print(response.body);
    }
  }

  Future<SupCategoryModel?> getSupCategory(int id, context) async {
    String url = AppUrl.Supcategory;
    print(url);
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    var allurl = "$url/$id";
    print(allurl.toString());
    var my_url = Uri.parse(allurl);
    final response = await http.get(my_url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'applicaton/json',
      'Authorization': "Bearer " + token,
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      print(jsonData);
      print(jsonData["Sup"]);
      bool first_time = true;
      if (jsonData["Sup"] == 0 && first_time == true) {
        print("This item is product");

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Product_Sub(jsonData["Data"])));

        first_time = false;
      }

      return SupCategoryModel.fromJson(jsonData);
    } else {
      print(response.body);
    }
  }

  // Future<ShowRoomModel?> getShowRoom() async {
  //   String url = AppUrl.Show_Room;
  //   print(url);
  //   final response = await http.get(Uri.parse(url), headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'applicaton/json',
  //   });

  //   if (response.statusCode == 200) {
  //     var jsonData = json.decode(response.body);
  //     return ShowRoomModel.fromJson(jsonData);
  //   } else {
  //     print(response.body);
  //   }
  //}
}
