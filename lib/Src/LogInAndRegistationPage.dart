import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Registation/Donor.dart';
import 'package:fundapp/Src/Registation/Ngo.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:fundapp/Src/Widget/Dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Display/Home.dart';

class LogInAndRegistationPage extends StatefulWidget {
  @override
  _LogInAndRegistationPageState createState() =>
      _LogInAndRegistationPageState();
}

class _LogInAndRegistationPageState extends State<LogInAndRegistationPage> {
  var _email_controller = new TextEditingController();
  var _password_controller = new TextEditingController();

  var _isPressLogIn = false;

  var logIn = true;

  var topContainerSize = 0.0;

  var bottomContainerSize = 0.0;

  var registationStatus = 0;

  var _name_of_registation = "";

  var opacity = 0.0;

  FB fb = new FB();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (topContainerSize == 0.0 && bottomContainerSize == 0.0) {
      bottomContainerSize = MediaQuery.of(context).size.height / 2;
      topContainerSize = MediaQuery.of(context).size.height / 2;
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (_name_of_registation != "") {
            setState(() {
              _name_of_registation = "";

              opacity = 0.0;

              _name_of_registation = "";

              bottomContainerSize = MediaQuery.of(context).size.height / 2;

              topContainerSize = MediaQuery.of(context).size.height / 2;
            });
          } else {
            exit(0);
          }
        },

        /*
          * _isPressLogIn
              ? Positioned.fill(
                  child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.deepOrange,
                  ),
                ))
              : Container(),
          *
          * */

        child: Scaffold(
          backgroundColor: Color(0xffF7F7F7),
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: new Column(
                    children: <Widget>[_top(), _bottom()],
                  ),
                ),
                _isPressLogIn
                    ? Positioned.fill(
                        child: Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.deepOrange,
                        ),
                      ))
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _top() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: MediaQuery.of(context).size.width,
      height: topContainerSize,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 10),
        //borderRadius: BorderRadius.only( bottomLeft:Radius.circular(20),bottomRight:Radius.circular(20)),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),

        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 0.6, spreadRadius: 2)
        ],

        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(1), BlendMode.dstATop),
            fit: BoxFit.cover,
            image: AssetImage("Img/poor_img.jpeg")),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(),
      ),
    );
  }

  Widget _bottom() {
    return Expanded(
        child: AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: bottomContainerSize,
      child: Stack(
        children: <Widget>[
          _name_of_registation == ""
              ? Column(
                  children: <Widget>[
                    LogInAndRegistationButton(),
                    Padding(padding: EdgeInsets.only(bottom: 15)),
                    logIn ? logInPage() : registationPage(),
                  ],
                )
              : registation(),
        ],
      ),
    ));
  }

  Widget LogInAndRegistationButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  logIn = true;
                });
              },
              child: Text(
                "LogIn",
                style: TextStyle(
                    color: logIn ? Color(0xff172E4B) : Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),

            //  Container()

            InkWell(
              onTap: () {
                setState(() {
                  logIn = false;
                });
              },
              child: Text(
                "Registration",
                style: TextStyle(
                    color: logIn ? Colors.black54 : Color(0xff172E4B),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }

  Widget logInPage() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  controller: _email_controller,
                  decoration: new InputDecoration(
                    filled: true,
                    //fillColor: Colors.grey[300],
                    hintText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF7F7F7),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: TextField(
                  controller: _password_controller,
                  obscureText: true,
                  decoration: new InputDecoration(
                    filled: true,
                    //fillColor: Colors.grey[300],
                    hintText: 'Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 3)),
              /* new Text(
                "Forgot your password?",
                style: TextStyle(color: Color(0xff5C5C5C)),
                textAlign: TextAlign.right,
              )*/
            ],
          ),
        ),

        Padding(padding: EdgeInsets.only(bottom: 40)),

        //  Spacer(),
        InkWell(
          onTap: () {
            setState(() {
              _isPressLogIn = true;
            });

            print("Tab");

            if (_email_controller.value.text == "admin@gmail.com" &&
                _password_controller.value.text == "123456") {
              Common.gmail = _email_controller.value.text;
              Common.usertype = "Admin";

              addDataToSP();

              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              print("Email  ${_email_controller.value.text}");
              print("Password   ${_password_controller.value.text}");

              if (_email_controller.value.text.isNotEmpty &&
                  _password_controller.value.text.isNotEmpty) {
                fb
                    .logIn(_email_controller.value.text,
                        _password_controller.value.text)
                    .then((value) {
                  print("Valueeeeeee test ${value}");

                  if (value != null) {
                    List userInfo = value.split(",");

                    storeToSpAndNavigateToHomeActivity(
                        userInfo[0], userInfo[1]);
                  } else {
                    setState(() {
                      _isPressLogIn = false;
                    });

                    MyDialog.showDialog("Failed to log in..", "Error", context);
                  }
                });
              } else {
                setState(() {
                  _isPressLogIn = false;
                });

                Common.ShowDialog("Empty Filed",
                    "Please enter your gmail and password", context);
              }
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(color: Color(0xffFF5126)),
            child: Center(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Color(0xffFDEBE3), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget registationPage() {
    return Stack(
      children: <Widget>[
        registationButton(),
      ],
    );
  }

  Widget registationButton() {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              registationStatus = 1;

              bottomContainerSize = MediaQuery.of(context).size.height;

              topContainerSize = 0.0;

              _name_of_registation = "Donor";

              opacity = 1;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(color: Color(0xffFF5126)),
            child: Center(
              child: Text(
                "Donor",
                style: TextStyle(
                    color: Color(0xffFDEBE3), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 15)),
        InkWell(
          onTap: () {
            setState(() {
              registationStatus = 2;
              bottomContainerSize = MediaQuery.of(context).size.height;

              topContainerSize = 0.0;

              _name_of_registation = "NGO";

              opacity = 1;
            });
          },
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            width: MediaQuery.of(context).size.width,
            height: 40,
            decoration: BoxDecoration(color: Color(0xffFF5126)),
            child: Center(
              child: Text(
                "NGO",
                style: TextStyle(
                    color: Color(0xffFDEBE3), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget registation() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: opacity,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffF7F7F7),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Registation For , \n                        ${_name_of_registation}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          opacity = 0.0;

                          _name_of_registation = "";

                          bottomContainerSize =
                              MediaQuery.of(context).size.height / 2;

                          topContainerSize =
                              MediaQuery.of(context).size.height / 2;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.black54,
                        size: 30,
                      ))
                ],
              ),
            ),
            _name_of_registation == "Donor"
                ? DonorRegistation()
                : NgoRegistation(),
          ],
        ),
      ),
    );
  }

  void storeToSpAndNavigateToHomeActivity(userInfo, userInfo2) async {
    print("Userrrrrrrrrrrrrrrrrrrrrrrrr info ${userInfo} ${userInfo2}");

    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("user", userInfo);
    sp.setString("gmail", _email_controller.value.text);

    Common.gmail = _email_controller.value.text;
    Common.usertype = userInfo.toString();

    setState(() {
      _isPressLogIn = false;
    });

    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => HomePage()));
  }

  void addDataToSP() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("user", "Admin");
    sp.setString("gmail", _email_controller.value.text);
  }
}
