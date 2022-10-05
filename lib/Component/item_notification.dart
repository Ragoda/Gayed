import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';



class ItemNotification extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const ItemNotification(
      {
        required this.icon,
        required this.title,
        required this.subTitle
      })
    ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10)
        ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(icon,color: Colors.orangeAccent,),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        height: 80.0,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(title,style: textBoldBlack,overflow: TextOverflow.ellipsis,),
                            Container(
                                child: Text(subTitle,style: textStyle,overflow: TextOverflow.ellipsis,)
                            )
                          ],
                        ),
                      )
                  ),
                  SizedBox(width: 10.0,)
                ],
              ),
             // Divider(),
            ],
          )
      ),
    );
  }
}
