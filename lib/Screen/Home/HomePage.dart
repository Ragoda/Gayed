import 'package:Gayd/Screen/Home/slider.dart';
import 'package:flutter/material.dart';
import 'gridle.dart';






class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    @override
  void initState() {
  
    super.initState();
  }


  

  @override
  Widget build(BuildContext context) {
    return
       SingleChildScrollView(
         child: Column(children: [
//CarouseDemo(),

GridViewpace(),


      ]),
       );
  }
}

