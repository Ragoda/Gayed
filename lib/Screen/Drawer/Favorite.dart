import 'package:Gayd/Component/Inkwellcustom.dart';
import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:Gayd/theme/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  // final ProductData productData;
  // final int index;

  // const FavoriteCardList({required Key key, this.productData,required this.index}) : super(key: key);

  @override
  _FavoriteCardListState createState() => _FavoriteCardListState();
}

class _FavoriteCardListState extends State<Favorite> {
  bool isLike = true;

  @override
  Widget build(BuildContext context) {
    var r;
    return SizedBox(
      height: 400,
      child: Card(
          child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: 4,
          itemBuilder: (ctx, i) {
            return Card(
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3))),
                child: Container(
                  height: 10,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.all(1),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              'https://cdn.pixabay.com/photo/2017/09/09/18/25/living-room-2732939_960_720.jpg',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.red,
                              ),
                              Text(
                                'Visual Solutions',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 8,
            mainAxisExtent: 150,
          ),
        ),
      )),
    );
  }
}
