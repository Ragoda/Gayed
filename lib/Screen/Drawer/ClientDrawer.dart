import 'package:Gayd/Screen/Home/Card.dart';
import 'package:Gayd/Screen/Home/Profile.dart';
import 'package:Gayd/Screen/Home/Search.dart';
import 'package:Gayd/Screen/tabbar.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'ContactUs.dart';
import 'package:flutter_share/flutter_share.dart';
import 'Favorite.dart';
import 'Service.dart';


class ClientDrawer extends StatefulWidget {
  @override
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<ClientDrawer> {


  @override
  void initState() {

    super.initState();
   

  }
   Future<void> share() async {
    await FlutterShare.share(
        title: ' share app',
        text: '',
        linkUrl: 'https://flutter.dev/',
        );
  }
  //   _launchURL() async {
  // const url = 'https://m.box.com/shared_item/https%3A%2F%2Fapp.box.com%2Fs%2F5h7h3iikf4v8muz4n2ctggg1nn4pau70';
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
//}
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
 
    return 
   Scaffold(
    
     body: Container(
  
                     padding: const EdgeInsets.only(left: 0,bottom: 10),
                    height: height,
             child: new  ListView(
                    children: <Widget>[
                      new Container(
                            decoration:BoxDecoration(
                           
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
        
          
        ),
              ),  
                       
                          child: Container(height: 90,
                            child: DrawerHeader(
                              
                              
                decoration: BoxDecoration(
                 color: primaryColor,
                ),
               
                  child: Column(
                    children: [
                      
                      new Text("قايض",
                                   
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 33)),
                                          //  Text("Be Original", style: TextStyle(
                                          // color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                          // fontSize: 15)
                                        //),
                    ],
                  ),
                )),
                          ),
            
 
                
                      new Container(
                                          decoration:BoxDecoration(
                             color: Colors.white,
      
          
        
              ),  
                        
                        
                     
                        child: new Column(
                          children: <Widget>[

                            new ListTile(
                                leading: Icon(Icons.home),
                                title: new Text('الصفحة الرئيسية'),
                                onTap: () {
                                  //      Navigator.of(context).push(_Order());
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Tabarr()));
                                }),

                            new Divider(),

                            new ListTile(
                                leading: Icon(Icons.shopping_cart),
                                title: new Text('  السلة '),
                                onTap: () {
                               //   Navigator.of(context).push(_Cancle_Order());
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Caard()));
                                }),
                           new Divider(),
                          

                            new ListTile(
                                leading: Icon(Icons.favorite),
                                title: new Text(" المفضلة"),
                                onTap: () {
                               //   Navigator.of(context).push(_ProfilePage());
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Favorite()));
                                }),
                       
                            new ListTile(
                                leading: Icon(Icons.people),
                                title: new Text("الصفحة الشخصية  "),
                                onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfile()));
                                }),
                            new ListTile(
                                leading: Icon(Icons.search),
                                title: new Text(" البحث عن منتج "),
                                onTap: () {
                              //    Navigator.of(context).push(_Contact());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchPage()));
                                }),
                    //         new ListTile(
                    //             leading: Icon(Icons.settings),
                    //             title: new Text("FAQ"),
                    //             onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> FAQ()));
                    //             }),
                                  new ListTile(
                            leading: Icon(Icons.phone),
                            title: new Text(
                              "تواصل معنا ",
                              style: new TextStyle(
                                   fontSize: 17.0),
                            ),
                            onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactUs()));
                              
                            }),
                                       new ListTile(
                            leading: Icon(Icons.share),
                            title: new Text(
                              "مشاركة التطبيق",
                              style: new TextStyle(
                               fontSize: 17.0),
                            ),
                            onTap: () {
                              share();
                              
                              
                            }),
                      Column(
                //  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                      children: [
                        Container(width: 30,),
                        InkWell(
                          
                          onTap:() async {
  
  // const url = 'https://www.facebook.com/SHARPSUDAN/';
  // if (await canLaunch(url)) {
  //     await launch(url);
  // } else {
  //     throw 'Could not launch $url';
  // }
}



                          ,
                          child: Hero(tag: Icon, child: FaIcon(Icons.facebook,color: Colors.blue,size: 50,))),
Container(width: 30,),
                          Hero(tag: Icon, child: FaIcon(FontAwesomeIcons.instagramSquare,color: Colors.black87,size: 50,), ),
                          Container(width: 30,),
                          Hero(tag: Icon, child: FaIcon(FontAwesomeIcons.youtube,color:Colors.red,size: 50,), ),
                          Container(width: 30,),
                             
                      ],
                    ),
                     
                   
                    ],
                  ),
                          ]))
                    ])
  ),
   );
                
              
      
  
      
    }
    



}