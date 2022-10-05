import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';






  class ContactUs extends StatelessWidget {
    const ContactUs({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
  
  
  return new Scaffold(
  body: new Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.all(20)),
      new ListTile(
        leading: const Icon(Icons.person),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: "الاسم",
          ),
        ),
      ),

      new ListTile(
        leading: const Icon(Icons.email),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: "البريد الالكتروني",
          ),
        ),
      ),
            new ListTile(
        leading: const Icon(Icons.details),
        title: new TextField(
          decoration: new InputDecoration(
            hintText: "التفاصيل",
          ),
        ),
      ),Padding(padding: EdgeInsets.all(20)),
      InkWell(
        child: Container(
                            
                              width: 80,
                              color: primaryColor,
                              child: Text("   ارسال",style: TextStyle(color: Colors.white,fontSize: 20),),
      ))
      
      
      ]));}}