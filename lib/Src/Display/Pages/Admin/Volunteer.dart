import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fundapp/Src/Display/Pages/DateAndTime.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

class Volunteer extends StatefulWidget {
  @override
  _VolunteerState createState() => _VolunteerState();
}

class _VolunteerState extends State<Volunteer> {
  var _name_controller = TextEditingController();
  var _email_controller = TextEditingController();
  var _number_controller = TextEditingController();

  // var _time = TextEditingController();

  var selectedDate;

  bool isLoading = false;

  FB fb = new FB();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        loadVolunteer(),
        Positioned(
            right: 15,
            bottom: 15,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                addVolunteer();
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

  void addVolunteer() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            backgroundColor: Colors.white,
            title: Text("Add Volunteer"),
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
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _number_controller,
              decoration: new InputDecoration(
                filled: true,
                //fillColor: Colors.grey[300],
                hintText: 'Number',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  loadVolunteer() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: StreamBuilder(
        stream: FirebaseDatabase.instance
            .reference()
            .child(Common.volinteer)
            //.child(Common.gmail.replaceAll(".", ""))
            .onValue,
        builder: (BuildContext context, event) {
          //  print(snapshot.data.values);

          if (event.hasError ||
              event.data == null ||
              event.data.snapshot.value == null) {
            return Container();
          } else {
            List _name_list = new List();
            List _email_list = new List();
            List _number_list = new List();
            // List _approved_list = new List();

            Map<dynamic, dynamic> branch = event.data.snapshot.value;
            branch.forEach((key, value) {
              _name_list.add(value["Name"]);
              _email_list.add(value["Email"]);
              _number_list.add(value["Number"]);

              // _approved_list.add(value["approved"]);
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Name : ${_name_list[index]}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Email  : ${_email_list[index]}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Number :${_number_list[index]}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
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
          },
          color: Colors.red,
          textColor: Colors.white,
          child: Text("Cancel"),
        ),
        RaisedButton(
          onPressed: () {
            print("Seleted Date  ${selectedDate}");

            if (_name_controller.value.text.isNotEmpty &&
                _number_controller.value.text.isNotEmpty &&
                _email_controller.value.text.isNotEmpty) {
              setState(() {
                isLoading = true;
              });

              fb
                  .saveVolunteer(
                _name_controller.value.text,
                _email_controller.value.text,
                _number_controller.value.text,
              )
                  .then((value) {
                if (value) {
                  setState(() {
                    isLoading = false;
                  });

                  _name_controller.text = "";
                  _email_controller.text = "";
                  _number_controller.text = "";

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
