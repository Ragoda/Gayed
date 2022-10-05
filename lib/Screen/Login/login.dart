import 'package:Gayd/Component/Inkwellcustom.dart';
import 'package:Gayd/Component/validations.dart';
import 'package:Gayd/app_localization/localization/localization_methods.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool show = false;
   String? _phone;
  String ?_password;
  Validations validations = new Validations();
  bool autovalidate = false;

  @override
  Widget build(BuildContext context) {
    // var regist_vendorProvi =
    //     Provider.of<regist_vendorProvider>(context, listen: false);
    // //   var clientJourney = Provider.of<ClientJourneyProvider>(context, listen: false);
    // final screenSize = MediaQuery.of(context).size;
    // AuthProvider auth = Provider.of<AuthProvider>(context);
    // var subscriptionsProvid = Provider.of<regist_vendorProvider>(context);
    submit() async {
      final FormState? form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        setState(() {
          show = true;
        });
      //  auth.login(context, _phone, _password);
        //     .then((response) async {
        //       print(response);
        //       if (response['status']) {
        //         print("fffffffffffffffffffffffffffffffffff");
        //         // SharedPreferences getData = await SharedPreferences.getInstance();

        //         // String token = getData.getString("mytoken");

        //         //   subscriptionsProvid.allPlans(token, context);
        //         // setState(() {
        //         //   show = false;
        //         // });
        //         Navigator.pushNamed(context, '/home');
        //       } else {
        //         setState(() {
        //           show = false;
        //         });
        //         regist_vendorProvi.allPlans(token, context);
        //         Flushbar(
        //           title: "login Failed",
        //           message: response.toString(),
        //           duration: Duration(seconds: 10),
        //         ).show(context);
        //       }
        //     });
        //   } else {
        //     Flushbar(
        //       title: "Invalid form",
        //       message: "Please Complete the form properly",
        //       duration: Duration(seconds: 10),
        //     ).show(context);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: InkWellCustom(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Stack(children: <Widget>[
              Container(
                height: 350.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/login.jpg"),
                        fit: BoxFit.cover)),
              ),
              new Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 120.0, 15.0, 0.0),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.only(top: 130.0),
                          child: new Container(
                            width: MediaQuery.of(context).size.width - 20.0,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: new Form(
                                key: formKey,
                                child: new Container(
                                  padding: EdgeInsets.all(18.0),
                                  child: new Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                          onSaved: (value) {
                                            _phone = value!;
                                            print(_phone);
                                          },
                                          keyboardType: TextInputType.phone,
                                          validator: (key) => validations
                                              .validateMobile(context, key!),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              prefixIcon: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: Colors.black,
                                                  size: 20.0,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 15.0, top: 15.0),
                                              hintText: getTranslated(
                                                  context, "phone_number"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Cairo"))),
                                      TextFormField(
                                          onSaved: (value) {
                                            _password = value!;
                                            print(_password);
                                          },
                                          obscureText: true,
                                          validator: (key) => validations
                                              .validatePassword(context, key!),
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              prefixIcon: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.lock,
                                                  color: Colors.black,
                                                  size: 20.0,
                                                ),
                                              ),
                                              contentPadding: EdgeInsets.only(
                                                  left: 15.0, top: 15.0),
                                              hintText: getTranslated(
                                                  context, "password"),
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "Cairo"))),
                                      new ButtonTheme(
                                        height: 50.0,
                                        minWidth:
                                            MediaQuery.of(context).size.width,
                                        child: RaisedButton.icon(
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0)),
                                          elevation: 0.0,
                                          color: primaryColor,
                                          icon: new Text(''),
                                          label: new Text(
                                            getTranslated(context, "login"),
                                            style: headingWhite,
                                          ),
                                          onPressed: () async {
                                            print("kkkkkkkkkkkkkkkkkkkk");
                                            submit();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          )),
                      Visibility(
                        visible: show,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            getTranslated(context, "havnt_account"),
                            style: textGrey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          new InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, '/signup'),
                            child: new Text(
                              getTranslated(context, "create_account"),
                              style: textStyleActive,
                            ),
                          ),
                        ],
                      )),
                      new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/reset');
                            },
                            child: new Text(
                              getTranslated(context, "forgot_pass"),
                              style: textStyleActive,
                            ),
                          ),
                        ],
                      )),
                    ],
                  )),
            ])
          ]),
        ),
      ),
    );
  }
}
