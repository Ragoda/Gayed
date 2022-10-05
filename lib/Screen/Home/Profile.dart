import 'package:Gayd/Component/utilsConst.dart';
import 'package:Gayd/Component/validations.dart';
import 'package:Gayd/Provider/AuthProvider.dart';
import 'package:Gayd/Screen/Drawer/ClientDrawer.dart';
import 'package:Gayd/Screen/Login/login.dart';
import 'package:Gayd/Utile/widgets.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../tabbar.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Validations validations = new Validations();
  late String lastSelectedValue;
  DateTime date = DateTime.now();
  var _image;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  TextEditingController _addressController = TextEditingController();
  TextEditingController _last_nameController = TextEditingController();

  late String token;
  late String phone;

  bool show = false;

  String phone_id = "";

  void getMyData() async {
    SharedPreferences getData = await SharedPreferences.getInstance();
    String? name = getData.getString("name");
    String? last_name = getData.getString('last_name');
    String? phone = getData.getString("phone");
    String? email = getData.getString("email");
    phone_id = getData.getString("phone_id")!;
    token = getData.getString("token")!;
    print(token);
    setState(() {
      _nameController.text = name.toString();

      _last_nameController.text = last_name.toString();
      _phoneController.text = phone.toString();

      _addressController.text = email;
    });
  }

  void initState() {
    this.getMyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(phone_id);
    var updateProvider = AuthProvider;
    submit() {
      final FormState? form = formKey.currentState;
      if (form!.validate()) {
        form.save();
        setState(() {
          show = true;
        });

        AuthProvider()
            .profile_update(
                context,
                phone_id,
                _nameController.text,
                _last_nameController.text,
                _emailController.text,
                _phoneController.text)
            .then((data) {
          print("ffffffffffffffffffffffffffffffff");

          print(data.toString());
          if (data['status'] == false || data['status'] == true) {
            setState(() {
              show = false;
            });
          }
        });
      }
    }

    if (Constant.isLogin)
      return Login();
    else
      return WillPopScope(
        onWillPop: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Tabarr()),
              (route) => true);
          return Future.value(true);
        },
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: ClientDrawer(),
          appBar: AppBar(
            actions: [
              appBar(
                "Edit Profile",
                size,
                context,
                _scaffoldKey,
                true,
              ),
            ],
          ),
          body: Scrollbar(
            child: ListView(children: [
              InkWell(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(new FocusNode()),
                  child: Form(
                    key: formKey,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            color: whiteColor,
                            padding: EdgeInsets.all(10.0),
                            margin: EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: size.width / 2.5),
                                      child: CircleAvatar(
                                        radius: 50, //radius is 50
                                        backgroundImage: NetworkImage(
                                          'https://e7.pngegg.com/pngimages/613/636/png-clipart-computer-icons-user-profile-male-avatar-avatar-heroes-logo-thumbnail.png',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: whiteColor,
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            'Name',
                                            style: headingBlack,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          cursorColor: primaryColor,
                                          validator: (key) => validations
                                              .validateName(context, key!),
                                          keyboardType: TextInputType.name,
                                          style: textStyle,
                                          decoration: InputDecoration(
                                              fillColor: whiteColor,
                                              labelStyle: textStyle,
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              counterStyle: textStyle,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              border: UnderlineInputBorder()),
                                          controller: _nameController,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            'Last Name',
                                            style: headingBlack,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          cursorColor: primaryColor,
                                          validator: (key) => validations
                                              .validateName(context, key!),
                                          keyboardType: TextInputType.name,
                                          style: textStyle,
                                          decoration: InputDecoration(
                                              fillColor: whiteColor,
                                              labelStyle: textStyle,
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              counterStyle: textStyle,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              border: UnderlineInputBorder()),
                                          controller: _last_nameController,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            'Phone',
                                            style: headingBlack,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          cursorColor: primaryColor,
                                          enabled: false,
                                          validator: (key) => validations
                                              .validateMobile(context, key!),
                                          maxLength: 10,
                                          keyboardType: TextInputType.phone,
                                          style: textStyle,
                                          decoration: InputDecoration(
                                              fillColor: whiteColor,
                                              labelStyle: textStyle,
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              counterStyle: textStyle,
                                              border: UnderlineInputBorder()),
                                          controller: _phoneController,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Text(
                                            "Email",
                                            style: headingBlack,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: TextFormField(
                                          cursorColor: primaryColor,
                                          validator: (key) => validations
                                              .validateEmail(context, key!),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: textStyle,
                                          decoration: InputDecoration(
                                              fillColor: whiteColor,
                                              labelStyle: textStyle,
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              counterStyle: textStyle,
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColor),
                                              ),
                                              border: UnderlineInputBorder()),
                                          controller: _addressController,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: show,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: primaryColor,
                                  )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: new ButtonTheme(
                                    height: 45.0,
                                    minWidth:
                                        MediaQuery.of(context).size.width - 50,
                                    child: RaisedButton.icon(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      elevation: 0.0,
                                      color: primaryColor,
                                      icon: new Text(''),
                                      label: new Text(
                                        "save",
                                        style: headingWhite,
                                      ),
                                      onPressed: () {
                                        submit();
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ]),
          ),
        ),
      );
  }
}
