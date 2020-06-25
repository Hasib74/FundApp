import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Utlis/Common.dart';


class Employ extends StatefulWidget {
  @override
  _EmployState createState() => _EmployState();
}

class _EmployState extends State<Employ> {
  var _name_controller = TextEditingController();
  var _location_controller = TextEditingController();
  var _phoneNumber = TextEditingController();
  var _email_address = TextEditingController();

  bool isLoading = false;

  FB fb = new FB();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        loadEmploy(),
        Positioned(
            right: 15,
            bottom: 15,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                addEmploy();
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.black,
              ),
            ))
      ],
    );
    ;
  }

  void addEmploy() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            backgroundColor: Colors.white,
            title: Text("Add Employ"),
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Stack(
                      children: <Widget>[
                        _textFileds(),
                        _loading(),
                      ],
                    ),
                    _buttons(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _textFileds() {
    return Column(
      //shrinkWrap: true,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xffF7F7F7),
            borderRadius: BorderRadius.all(Radius.circular(4)),
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
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: TextField(
              controller: _location_controller,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Location',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: TextField(
              controller: _phoneNumber,
              keyboardType: TextInputType.number,
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
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: TextField(
              controller: _email_address,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Email',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  loadEmploy() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: StreamBuilder(
        stream: FirebaseDatabase.instance
            .reference()
            .child(Common.employ)
            .child(Common.gmail.replaceAll(".", ""))
            .onValue,
        builder: (BuildContext context, AsyncSnapshot<Event> event) {
          //  print(snapshot.data.values);

          if (event.hasError ||
              event.data == null ||
              event.data.snapshot.value == null) {
            return Container();
          } else {
            List _name_list = new List();
            List _location_list = new List();
            List _phone_number_list = new List();
            List _email_list = new List();
            List _approved_list = new List();

            Map<dynamic, dynamic> branch = event.data.snapshot.value;
            branch.forEach((key, value) {
              _name_list.add(value["Name"]);
              _location_list.add(value["Location"]);
              _phone_number_list.add(value["Phone Number"]);
              _email_list.add(value["Email"]);

              _approved_list.add(value["approved"]);
            });

            return ListView.builder(
                itemCount: _name_list.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          border: Border.all(color: Colors.black12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _name_list[index],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _location_list[index],
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            _approved_list[index] == null
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.black54,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.greenAccent,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }

  _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
            _name_controller.text="";
            _location_controller.text="";
            _phoneNumber.text="";
            _email_address.text="";

          },
          color: Colors.red,
          textColor: Colors.white,
          child: Text("Cancel"),
        ),
        RaisedButton(
          onPressed: () {
            if (_name_controller.value.text.isNotEmpty &&
                _location_controller.value.text.isNotEmpty &&
                _phoneNumber.value.text.isNotEmpty &&
                _email_address.value.text.isNotEmpty) {
              setState(() {
                isLoading = true;
              });

              /*
              * name,location,phone,email
              * */
              fb
                  .saveEmployByDonor(
                      _name_controller.value.text,
                      _location_controller.value.text,
                      _phoneNumber.value.text,
                      _email_address.value.text)
                  .then((value) {
                if (value) {
                  setState(() {
                    isLoading = false;
                  });

                  _name_controller.text = "";
                  _location_controller.text = "";
                  _phoneNumber.text = "";
                  _email_address.text = "";

                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    isLoading = false;
                  });
                }
              });
            } else {
              //Empty

            }
          },
          color: Colors.greenAccent,
          textColor: Colors.white,
          child: Text("Save"),
        ),
      ],
    );
  }

  _loading() {
    return isLoading
        ? Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
              ),
            ),
          )
        : Container();
  }
}
