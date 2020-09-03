import 'package:flutter/material.dart';
import 'package:fundapp/Src/AppHelper/AppData.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Display/Home.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:fundapp/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NgoRegistation extends StatefulWidget {
  @override
  _NgoRegistationState createState() => _NgoRegistationState();
}

class _NgoRegistationState extends State<NgoRegistation> {
  var _name_controller = new TextEditingController();
  var _govt_doccuments_approved_controller = new TextEditingController();
  var _serial_number_controller = new TextEditingController();
  var _email_conroller = new TextEditingController();
  var _refferance_id_controller = new TextEditingController();
  var _phone_number_controller = new TextEditingController();
  var _password_controller = new TextEditingController();
  var _confirm_password_controller = new TextEditingController();

  bool isLoading = false;

  FB fb = new FB();

  bool isfingerPrint = false;
  var fingerPrintValue;

  @override
  Widget build(BuildContext context) {
    fingurPrint.actionFingur();
    return Stack(
      children: <Widget>[
        textFiledsAndButton(),
        isLoading ? loading() : Container(),
      ],
    );
  }

  validation() {
    bool validation;

    if (_password_controller.value.text.isNotEmpty &&
        _confirm_password_controller.value.text.isNotEmpty &&
        _password_controller.value.text ==
            _confirm_password_controller.value.text) {
      if (_name_controller.value.text.isNotEmpty &&
          _email_conroller.value.text.isNotEmpty &&
          _govt_doccuments_approved_controller.value.text.isNotEmpty &&
          _serial_number_controller.value.text.isNotEmpty &&
          _refferance_id_controller.value.text.isNotEmpty &&
          _phone_number_controller.value.text.isNotEmpty) {
        if (_email_conroller.value.text.contains("@")) {
          validation = true;
        } else {
          Common.snackBar("Email is formated ", context);

          AppData.current_snackbar_text = "Email is formated ";
        }
      } else {
        AppData.current_snackbar_text = "Empty Fileds";

        validation = false;
      }
    } else {
      AppData.current_snackbar_text = "Password is not correct";

      validation = false;
    }

    return validation;
  }

  textFiledsAndButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              controller: _name_controller,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Name',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              controller: _phone_number_controller,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Phone Number',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              controller: _govt_doccuments_approved_controller,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Govt Documents',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              controller: _serial_number_controller,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Serial Number',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              controller: _email_conroller,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Email /Mobile/Telephone ',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              controller: _refferance_id_controller,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Reffernce (Mendatory)',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _password_controller,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Password ',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _confirm_password_controller,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Confirm Password ',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 0)),
        InkWell(
          onTap: () {
            setState(() {
              //  _isPressLogIn = true;

              if (validation()) {
                setState(() {
                  isLoading = true;
                });

                fb
                    .registationForNgo(
                        _name_controller.value.text,
                        _email_conroller.value.text,
                        _govt_doccuments_approved_controller.value.text,
                        _serial_number_controller.value.text,
                        _refferance_id_controller.value.text,
                        _phone_number_controller.value.text,
                        _password_controller.value.text)
                    .then((value) {
                  print("The value is ${value}");

                  switch (value) {
                    case "Success":
                      setState(() {
                        isLoading = false;
                      });

                      navigateToHomePage();

                      break;

                    case "Failed":
                      setState(() {
                        isLoading = false;
                      });

                      break;

                    case "You Are Already Registatred":
                      Common.ShowDialog(
                          "Failed !!!", "You are already registared", context);

                      setState(() {
                        isLoading = false;
                      });

                      break;
                  }
                });
              } else {
                Common.snackBar("${AppData.current_snackbar_text}", context);
              }
            });
          },
          child: Material(
            child: Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(color: Color(0xffFF5126)),
              child: Center(
                child: Text(
                  "Registation",
                  style: TextStyle(
                      color: Color(0xffFDEBE3), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  loading() {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.center, child: CircularProgressIndicator()),
    );
  }

  void navigateToHomePage() async {
    Common.usertype = "NGO";
    Common.gmail = _email_conroller.value.text;

    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("user", "NGO");
    sp.setString("gmail", _email_conroller.value.text);

    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => HomePage()));
  }
}
