import 'package:flutter/material.dart';
  class GridViewpace extends StatelessWidget {
  const GridViewpace({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
          double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
  
  return 
    SingleChildScrollView(
      
        child: SizedBox(
                height: height/1.25,
                child: GridView(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.010,
                          crossAxisSpacing:0.10,
                          mainAxisSpacing: 8,
                          mainAxisExtent: 130,
                        ),
                children: [
                  caard("ملابس","asset/clothes-hanger.png"),
                   caard("اطفال","asset/boy.png"),
                     caard("اجهزه كهربائية","asset/device.png"),
                      caard("سيارات","asset/car.png"),
                       caard("أثاثات","asset/furniture.png"),
                       caard("منتجات طبية","asset/healthcare.png"),
                       caard("الكترونيات","asset/elctro.png"),
                        caard("اخرى","asset/health.png"),
              ]),
         ),

          
    );
  }
}
Widget caard(String name,String imgurl){
return  Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              
              child: Container(
               padding: const EdgeInsets.only(top:20),
                child:   SingleChildScrollView(
                  child: Column(
                      children: [
                        Image.asset(
                                  imgurl,
                                //  color: Colors.red,
                                  height: 30,
                                  width: 30,
                                ),
                       Text(
                          name,
                            style: const TextStyle( fontSize:  18,),
                          ),
                        
                      ],
                    ),
                ),
                ),
              
            );}
