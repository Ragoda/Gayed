import 'package:Gayd/Component/item_notification.dart';
import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:Gayd/theme/style.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qaythara/Models/Notification/notifi.dart';
import 'package:qaythara/Notification/notification.dart';
import 'package:qaythara/app_localization/localization/localization_methods.dart';
import 'package:qaythara/providers/notifi_provider.dart';
import 'package:qaythara/theme/style.dart';
;

class NotificationScreens extends StatefulWidget {
  @override
  _NotificationScreensState createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
  late List<Map<String, dynamic>> listNotification;

  dialogInfo() {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      borderSide: BorderSide(color: primaryColor, width: 2),
      width: 500,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: getTranslated(context, "delete_notifi"),
      desc: getTranslated(context, "confirm_delete"),
      showCloseIcon: true,
      btnCancelOnPress: () {
        Navigator.pop(context);
      },
      btnOkOnPress: () {
        setState(() {
          listNotification.clear();
        });
      },
    )..show();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listNotification = [
      {
        "id": '0',
        "title": 'قيثارة',
        "subTitle": "تم تقيم منتجك بواسطة مهند",
        "icon": Icons.notifications
      },
      {
        "id": '1',
        "title": 'قيثارة',
        "subTitle": "يريد مهند شراء منتجك",
        "icon": Icons.notifications
      },
    ];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var Notifications_provide =
        Provider.of<Notifications_provider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
            title: Text(
              getTranslated(context, "notification"),
              style: TextStyle(color: blackColor, fontFamily: "Cairo"),
            ),
            backgroundColor: whiteColor,
            elevation: 0.0,
            iconTheme: IconThemeData(color: blackColor),
            actions: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.restore_from_trash,
                    color: blackColor,
                  ),
                  onPressed: () {
                    dialogInfo();
                  })
            ]),
        body: listNotification.length != 0
            ? Scrollbar(
                child: FutureBuilder(
                    future: Notifications_provide.my_Notifications(),
                    builder: (context, AsyncSnapshot<Notifications> snapshots) {
                      if (snapshots.data == null) {
                        SpinKitFadingCircle(
                          color: Colors.black,
                          size: 50.0,
                        );
                      }
                      if (snapshots.hasData == false)
                        return Center(
                            child: Text(
                          "Empty",
                          style: TextStyle(fontSize: 0, color: Colors.white),
                        ));
                      else {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshots.data.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Slidable(
                                  actionPane: SlidableScrollActionPane(),
                                  actionExtentRatio: 0.25,
                                  secondaryActions: <Widget>[
                                    IconSlideAction(
                                      caption: getTranslated(
                                          context, "slide_delete"),
                                      color: Colors.red,
                                      icon: Icons.delete,
                                      onTap: () {
                                        setState(() {
                                          listNotification.removeAt(index);
                                        });
                                      },
                                    ),
                                  ],
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: greyColor, width: 1))),
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: ItemNotification(
                                            title: (snapshots.data.data
                                                .data[index].data.title),
                                            subTitle: (snapshots.data.data
                                                .data[index].data.message),
                                            icon: listNotification[index]
                                                ['icon'],
                                          ))));
                            });
                      }
                    }))
            : Container(
                height: screenSize.height,
                child: Center(
                  child: Image.asset(
                    'assets/images/trash.png',
                    width: 100.0,
                  ),
                ),
              ));
  }
}