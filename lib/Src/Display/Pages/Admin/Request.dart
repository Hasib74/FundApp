import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  var tab = "Donor";

  FB fb =FB();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(5)),
        tabs(),
        tab == "Donor" ? donor() : ngo(),
      ],
    );
  }

  tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  tab = "Donor";
                });
              },
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                    color: tab == "Donor" ? Color(0xffFF5126) : Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, spreadRadius: 1, blurRadius: 1)
                    ]),
                child: Center(
                    child: Text(
                  "Donor",
                  style: TextStyle(
                      color: tab == "Donor" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  tab = "NGO";
                });
              },
              child: new Container(
                height: 30,
                decoration: BoxDecoration(
                    color: tab == "NGO" ? Color(0xffFF5126) : Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, spreadRadius: 1, blurRadius: 1)
                    ]),
                child: Center(
                    child: Text(
                  "NGO",
                  style: TextStyle(
                      color: tab == "NGO" ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
        )
      ],
    );
  }

  buttonAccceptOrDecline(gmail , userType) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: (){

            fb.accept(gmail, userType);
          },

          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(color: Colors.grey, width: 1)),
            child: Center(
              child: Text(
                "  Accepts   ",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        InkWell(
          onTap: (){

            fb.declie(gmail, userType);

          },

          child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: Colors.grey, width: 1)),
            child: Center(
              child: Text("  Dicline   ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }

  donor() {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child(Common.registation)
              .child(Common.donor)
              .onValue,
          builder: (context, AsyncSnapshot<Event> event) {
            if (event.hasError ||
                event.data == null ||
                event.data.snapshot.value == null) {
              print("Data not found");

              return Container();
            } else {
              print("Data  found");

              List _name_list = new List();

              List _email_list = new List();

              List _nid_or_passport = new List();
              List _referance = new List();

              //  Map<dynamic, dynamic> donor = event.data.snapshot.value;

              Map<dynamic, dynamic> donor = event.data.snapshot.value;

              donor.forEach((key, value) {
                if (value["approved"] == false) {
                  _name_list.add(value["Name"]);
                  _email_list.add(value["Email"]);
                  //  _phone_number_list.add(value["Phone Number"]);
               //   _email_list.add(value["Email"]);

                  _nid_or_passport.add(value["Passport Or Nid"]);

                  _referance.add(value["Refferance"]);

                  ///  _approved_list.add(value["approved"]);
                }
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
                                    _name_list[index] == null
                                        ? ""
                                        : _name_list[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    _email_list[index] == null
                                        ? ""
                                        : _email_list[index],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    _nid_or_passport[index] == null
                                        ? ""
                                        : _nid_or_passport[index],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    _referance[index] == null
                                        ? ""
                                        : _referance[index],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              buttonAccceptOrDecline(_email_list[index],"donar"),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }

  ngo() {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseDatabase.instance
              .reference()
              .child(Common.registation)
              .child(Common.ngo)
              .onValue,
          builder: (context, AsyncSnapshot<Event> event) {
            if (event.hasError ||
                event.data == null ||
                event.data.snapshot.value == null) {
              print("Data not found");

              return Container();
            } else {
              print("Data  found");

              List _name_list = new List();

              List _email_list = new List();

              List _serialNumber = new List();
              List _referance = new List();

              //  Map<dynamic, dynamic> donor = event.data.snapshot.value;

              Map<dynamic, dynamic> donor = event.data.snapshot.value;

              donor.forEach((key, value) {
                if (value["approved"] == false) {
                  _name_list.add(value["Name"]);
                  _email_list.add(value["Email"]);
                  //  _phone_number_list.add(value["Phone Number"]);


                  _serialNumber.add(value["Serial Number"]);

                  _referance.add(value["Refferance"]);

                  ///  _approved_list.add(value["approved"]);
                }
              });

              print(_name_list[0]);

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
                                    _name_list[index] == null
                                        ? ""
                                        : _name_list[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    _email_list[index] == null
                                        ? ""
                                        : _email_list[index],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    _serialNumber[index] == null
                                        ? ""
                                        : _serialNumber[index],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    _referance[index] == null
                                        ? ""
                                        : _referance[index],
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              buttonAccceptOrDecline(_email_list[index],"ngo"),

                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
