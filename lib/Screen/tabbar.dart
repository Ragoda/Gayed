
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Drawer/ClientDrawer.dart';
import 'Drawer/Favorite.dart';
import 'Home/Card.dart';
import 'Home/HomePage.dart';
import 'Home/Profile.dart';
import 'Home/Search.dart';





class Tabarr extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();

  static goToIntro(BuildContext context) {}
}

class _MyAppState extends State<Tabarr> {
  int _currentIndex=0;

  
    static  List<Widget> _widgetOptions = <Widget>[

  HomePage(),
  Caard(),
  Favorite(),
  Favorite(),

  MyProfile(),

  
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    
    });
  }

     
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer:Drawer(child: ClientDrawer(),),   

      appBar: new AppBar(
      
        backgroundColor:  primaryColor,
     
        actions: [IconButton(onPressed: (){
 Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
          
          }, icon:FaIcon(Icons.search,color: Colors.white,)),],
        title: Center(
          child: Row(
            children: [
               GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/notifi');
              },
              child: Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
              )),
              Padding(padding: EdgeInsets.only(left: 40)),
              new Text(
              'قايض',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Colors.white),
              ),
      
              
            ],
          ),
         ),
      
      ),
          body: 
        
 Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         elevation: 4,
        currentIndex: _currentIndex,
        selectedItemColor:primaryColor,
        unselectedItemColor: Colors.grey,
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label:"الرئيسية"
           
            ),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),
            
            label: "السلة",
            
            ),

       BottomNavigationBarItem(icon: Icon(Icons.label,size: 30,color: Colors.white,),
            
            label: "  ",
            
            ),
             BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),
            
            label: "المفضلة",
            
            ),
                BottomNavigationBarItem(icon: Icon(Icons.people_outline),
            
            label: " الصفحة الشخصية ",
            
            ),

        ],onTap: _onItemTapped,
          
        
      
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
        //  _incrementTab(1);
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );

      
     
   }

}