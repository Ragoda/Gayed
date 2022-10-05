import 'dart:convert';
import 'package:Gayd/Model/Favorite_Model.dart';
import 'package:Gayd/Utile/AppUrl.dart';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider {
  bool isLoading = false;
  bool isSuccess = false;
  void setIsLoading(bool isload) {
    isLoading = isload;
  }

  void setSucessVal(bool flag) {
    isSuccess = flag;
  }

  Future<Map<String, dynamic>> setOrder(context, product) async {
    var result;
    List cart = product.toList();
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    var dio = new Dio();
    print(token.toUpperCase());
    String url = AppUrl.Allorders;
    print(url);
    print(cart.length.toString());
    List rody = [];
    for (int i = 0; i < cart.length; i++) {
      var dataa = ({
        "product_id": int.parse(product[i]['id'].toString()),
        "quantity": product[i]['quantity'],
        "price": int.parse(product[i]['price']),
        "size": product[i]['sizeValue'],
        "color": product[i]['code_cololr'],
      });
      rody.add(dataa);
    }

    var response = await dio.post("$url",
        data: rody,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': "Bearer " + token,
          },
        ));
    print("Response status: ${response.statusCode}");
    print("Response data: ${response.data}");
    var data = response.data.toString();
    if (response.statusCode == 200) {
      print(response.data);
      var data = response.data;
      logindat = await SharedPreferences.getInstance();
      print(response.data.toString());
      var Odert_Id = data['Oder_Id'];
      var Delivery_Price = data['Delivery_Price'];
      logindat.setString('Delivery_Price', Delivery_Price);
      logindat.setInt('order_id', Odert_Id);
      print(Odert_Id);

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => ConfirmOrder(
      //             odert_id: Odert_Id, Delivery_Price: Delivery_Price)));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("The order has been sent successfully")));
      result = {
        'status': true,
      };

      return result;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("The order was not sent successfully")));
      print(response.data);
      result = {
        'status': false,
      };
      return result;
    }
  }

  confirmOrder(
      context, Order_id, imagePath, number_notification, String? pay) async {
    print(imagePath);
    String url = AppUrl.confirmOrder;
    var dio = new Dio();
    var result;
    var formData = FormData.fromMap({
      'order_id': "$Order_id",
      'number_notification': "$number_notification",
      'delivery': "$pay",
      'image': await MultipartFile.fromFile(imagePath, filename: 'upload.txt')
    });

    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    var uuri = Uri.parse(url);
    var response = await dio.post("$uuri",
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': "Bearer " + token,
          },
        ));
    print("Response status: ${response.statusCode}");
    print("Response data: ${response.data}");
    var data = response.data.toString();
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Successfully Comfiram Order")));

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Mybasket()));
      Hive.box('shopping_box').clear();
      result = {
        'status': true,
      };

      return response.statusCode;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Comfiram Order failed")));
      result = {
        'status': false,
      };
      return result;
    }
  }

  void getItems(pro_deta) async {}

  get Cart_Item_count async {
    void setIsLoading(bool isload) {
      isLoading = isload;
    }

    void setSucessVal(bool flag) {
      isSuccess = flag;
    }
//  List<CartItem> _items = [];

//   Box<CartItem> cartbox;

    void icrementCount(BuildContext context, count) {
      count++;
    }

    void decrementCount(BuildContext context, count) {
      if (count <= 1) {
        count = 1;
      } else {
        count--;
      }
    }
  }

  Future<FavoriteModeL?> getFavorite() async {
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    String url = AppUrl.Favorites;
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'applicaton/json',
      'Authorization': "Bearer " + token,
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return FavoriteModeL.fromJson(jsonData);
    } else {
      print(response.body);
    }
  }

  AddToFavorite(context, products_id) async {
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    var result;
    var urll = AppUrl.Favorites;
    var uurii = Uri.parse(urll);
    final respons = await http.post(uurii, headers: {
      'Accept': 'applicaton/json',
      'Authorization': "Bearer " + token,
    }, body: {
      'lang': 'En',
      'user_id': 'aaa',
      'products_id': products_id
    });
    var data = jsonDecode(respons.body);
    if (respons.statusCode == 200) {
      print("respons status: ${respons.statusCode}");
      print("respons data: ${respons.body}");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
      result = {
        'status': true,
      };

      return result;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));

      print("Response status: ${respons.statusCode}");
      print("Response data: ${respons.body}");
      result = {
        'status': true,
      };

      return result;
    }
    return result;
  }

  DeleteFavorite(context, products_id) async {
    String url = AppUrl.Favorites;

    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();

    final bodyDat = jsonEncode(
      {
        'lang': "En",
      },
    );
    var r = "$url/$products_id";
    var uuri = Uri.parse(r);
    var result;
    print("$uuri");
    final response = await http.delete(uuri,
        headers: {
          'Accept': 'applicaton/json',
          'Authorization': "Bearer " + token,
        },
        body: bodyDat);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.body}");
      result = {
        'status': true,
      };
      return result;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data["message"])));
      print("Response status: ${response.statusCode}");
      print("Response data: ${response.body}");
      result = {
        'status': true,
      };
      return result;
    }

    return result;
  }

  get_my_Orders() async {
    String url = AppUrl.myOrders;
    var logindat = await SharedPreferences.getInstance();
    String token = logindat.getString("token").toString();
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Accept': 'applicaton/json',
      'Authorization': "Bearer " + token,
    });

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print(jsonData);
      return jsonData;
    } else {
      print(response.body);
    }
  }

  Future getProduct() async {
    String url = AppUrl.product;
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

      return (jsonData as List).map((e) {
        return e == null ? null : e;
      }).toList();
    } else {
      print(response.body);
    }
  }

  final _shoppingBox = Hive.box('shopping_box');
  List<Map<String, dynamic>> _items = [];
  void _refreshItems() {
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {
        "key": key,
        "id": value[0]["id"],
        "name": value[0]["name"],
        "price": value[0]['price'],
        "image": value[0]['image'],
        "sizes": value[0]['sizes'],
        "code_cololr": value[2]['code_cololr'],
        "sizeValue": value[1]['sizeValue'],
        'colors': value[0]['colors'],
      };
    }).toList();

    //  _items = data.reversed.toList();
  }

  int get_item_count() {
    _refreshItems();
    List item = [];
    final data = _shoppingBox.keys.map((key) {
      final value = _shoppingBox.get(key);
      return {
        "key": key,
        "id": value[0]["id"],
        "name": value[0]["name"],
        "price": value[0]['price'],
        "image": value[0]['image'],
        "sizes": value[0]['sizes'],
        "code_cololr": value[2]['code_cololr'],
        "sizeValue": value[1]['sizeValue'],
        'colors': value[0]['colors'],
      };
    }).toList();
    _refreshItems();
    _items = data.reversed.toList();

    return _items.length;
  }

  Future<void> createItem(newItem) async {
    print(newItem.toString());

    await _shoppingBox.add(newItem);

    _refreshItems();
  }

  // Update a single item
  Future<void> _updateItem(int itemKey, item) async {
    await _shoppingBox.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey, context) async {
    await _shoppingBox.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }
}
