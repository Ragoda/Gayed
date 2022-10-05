import 'package:flutter/material.dart';






  class Caard extends StatelessWidget {
    const Caard({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
  
  
  return new 

  Card(
        elevation: 2,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 100,
                  decoration: BoxDecoration(
                    
                  ),
                  child: Image.asset("asset/logo.jpg"),
                ),
                SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "سيارة",
                        style: TextStyle(
                           //color: blackColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //  Text(cartItem.options.map((e) => e.option_id).toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ""+ " SDG")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              // Provider.of<CartProvider>(context, listen: false)
                              //     .removeItemFromCart(index, cartItem);
                            },
                            child: Image.asset(
                              "asset/car.png",
                              color: Colors.red,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    // if (cartItem.Amount > 1) {
                                    //   cartItem.Amount -= 1;
                                    //   Provider.of<CartProvider>(context,
                                    //           listen: false)
                                    //       .updateItemCart(index, cartItem);
                                 //   }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: Colors.white)
                                    ]),
                                child: Center(
                                    child: Text("2")),
                              ),
                              Container(
                                height: 40,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    // cartItem.Amount += 1;
                                    // Provider.of<CartProvider>(context,
                                    //         listen: false)
                                    //     .updateItemCart(index, cartItem);
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
        );
      
      
      }}