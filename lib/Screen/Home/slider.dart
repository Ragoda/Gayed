import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';







final List<String> imgList = [
  "https://my.sharp/sites/default/files/uploads/library/dw1x/img/1920x1080_AQUOS-8K-min-1.jpg",
  "https://www.sharp-sbs.com/portals/1/images/atlanta-ga-slider-1@2x.png",
  "https://vn.sharp/sites/default/files/uploads/2022-03/PCI%20Health%201920%20x%20868%20-%20update.jpg",
  "https://vn.sharp/sites/default/files/uploads/2022-03/KV-SHARP-PSUM-FINAL---1920-x-868.jpg",
  "https://vn.sharp/sites/default/files/uploads/2021-10/1024x442-Opt3r.jpg",
  
];


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                   
                  ],
                )),
          ),
        ))
    .toList();



class CarouseDemo extends StatefulWidget {
  @override
  _CarouseDemoState createState() => _CarouseDemoState();
}

class _CarouseDemoState extends State<CarouseDemo> {
    @override
  void initState() {
   
    super.initState();
  }


  int _current = 0;
  final CarouselController _controllerr = CarouselController();



  @override
  Widget build(BuildContext context) {
    return
       SingleChildScrollView(
         child: Column(children: [
    
             CarouselSlider(
              items: imageSliders,
              carouselController: _controllerr,
              options: CarouselOptions(
              disableCenter: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controllerr.animateToPage(entry.key),
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),

Padding(padding: EdgeInsets.all(30)),



      ]),
       );
  }
}


//   Widget buildSlider() {
//     return Container(
//       height: 180,
//       child: Consumer<ProductProvider>(builder: (context, viewmodel, __) {
//         switch (viewmodel.newestProducts.state) {
//           case ResponseState.LOADING:
//           case ResponseState.LOADING:
//             return Center(
//                 child: Container(
//               height: 200,
//               child: SpinKitFadingCircle(
//                 color: Colors.black,
//                 size: 50.0,
//               ),
//             ));
//             break;
//           case ResponseState.COMPLETE:
//             return SizedBox(
//                 // height: 480,
//                 child: Container(
//                     // height: 180,

//                     child: CarouselSlider.builder(
//                         itemCount: (viewmodel.newestProducts.data.length),
//                         options: CarouselOptions(
//                           height: 180.0,
//                           enlargeCenterPage: true,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration:
//                               Duration(milliseconds: 800),
//                           viewportFraction: 0.8,
//                         ),
//                         itemBuilder: (BuildContext context, int index) {
//                           var numb =
//                               viewmodel.newestProducts.data.length.toString();
//                           return numb != "0"
//                               ? Slid(context, index,
//                                   viewmodel.newestProducts.data[index])
//                               : Container();
//                         })));
//         }
//         return Container();
//       }),
//     );
//   }

//   Widget _buildListOfCategory() {
//     return Consumer<HomeviewProvider>(builder: (context, viewmodel, __) {
//       switch (viewmodel.categoryresponse.state) {
//         case ResponseState.LOADING:
//           return Center(
//               child: Container(
//             height: 200.w,
//             child: SpinKitFadingCircle(
//               color: Colors.black,
//               size: 50.0,
//             ),
//           ));

//           break;
//         case ResponseState.ERROR:
//           return Text(viewmodel.categoryresponse.exception);
//           break;
//         case ResponseState.COMPLETE:
//           return GestureDetector(
//             onTap: () {},
//             child: SizedBox(
//               height: 380.w,
//               child: RefreshIndicator(
//                 onRefresh: () {},
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 2),
//                       child: CategoryCard(
//                           categoryData: viewmodel.categoryresponse.data[index],
//                           Index: index),
//                     );
//                   },
//                   itemCount: viewmodel.categoryresponse.data.length,
//                 ),
//               ),
//             ),
//           );
//           break;
//       }

//       return Container();
//     });
//   }

//   Widget SlideIt(BuildContext context, int index, ProductData data) {
//     print(data);
//     return ProductCardList(product: data);
//   }

//   Widget Slid(BuildContext context, int index, ProductData data) {
//     return SlidList(product: data);
//   }
// }

// class ImageContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(6.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         image: DecorationImage(
//           image: AssetImage(
//             'assets/images/slider.JPG',
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }