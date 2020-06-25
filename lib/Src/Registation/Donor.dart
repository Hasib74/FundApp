import 'package:flutter/material.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Display/Home.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DonorRegistation extends StatefulWidget {
  @override
  _DonorRegistationState createState() => _DonorRegistationState();
}

class _DonorRegistationState extends State<DonorRegistation> {
  var _name_controller = new TextEditingController();
  var _email_controller = new TextEditingController();
  var _passport_or_nid_controller = new TextEditingController();
  var _mailing_address_controller = new TextEditingController();
  var _refferance_controller = new TextEditingController();
  var _password_controller = new TextEditingController();

  //var __controller = new TextEditingController();

  //Variables
  bool isLoading = false;

  FB fb = new FB();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        textFiledsAndButton(),
        isLoading ? loading() : Container(),
      ],
    );
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
              controller: _email_controller,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Email',
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
              controller: _passport_or_nid_controller,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Passport / NID',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: TextField(
              maxLines: 5,
              controller: _mailing_address_controller,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Mailing Address ',
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
              controller: _refferance_controller,
              decoration: new InputDecoration(
                filled: true,

                //fillColor: Colors.grey[300],
                hintText: 'Reffernce ',
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
        Padding(padding: EdgeInsets.only(top: 25)),
        InkWell(
          onTap: () {
            //Button click event for Donor Registrations..

            if (validation()) {
              setState(() {
                isLoading = true;
              });

              fb
                  .registationForDonor(
                      _name_controller.value.text,
                      _email_controller.value.text,
                      _passport_or_nid_controller.value.text,
                      _mailing_address_controller.value.text,
                      _refferance_controller.value.text,
                      _password_controller)
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
              Common.snackBar("Empty Filed !!! ", context);
            }
          },
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
      ],
    );
  }

  bool validation() {
    bool validation = false;

    if (_name_controller.value.text.isNotEmpty &&
        _email_controller.value.text.isNotEmpty &&
        _passport_or_nid_controller.value.text.isNotEmpty &&
        _mailing_address_controller.value.text.isNotEmpty &&
        _refferance_controller.value.text.isNotEmpty &&
        _password_controller.value.text.isNotEmpty) {
      validation = true;

      if (_password_controller.value.text.length >= 6) {
        validation = true;

        if (_email_controller.value.text.contains("@")) {
          validation = true;
        } else {
          validation = true;
          Common.snackBar("Email is formated ", context);
        }
      } else {
        Common.snackBar("Password should be atlist 6 character ", context);

        validation = false;
      }
    } else {
      Common.snackBar("Empty !!! ", context);
      validation = false;
    }

    return validation;
  }

  loading() {
    return Positioned.fill(
      child: Align(
          alignment: Alignment.center, child: CircularProgressIndicator()),
    );
  }

  void navigateToHomePage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString("user", "Donor");
    sp.setString("gmail", _email_controller.value.text);

    Common.usertype = "Donor";
    Common.gmail = _email_controller.value.text;

    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => Home()));
  }
}
