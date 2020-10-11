import 'package:flutter/material.dart';
import 'package:fundapp/Src/Display/Pages/Admin/Event.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';

class NgoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ngo();
  }

  ngo() {
    return StreamBuilder(
        stream: FirebaseDatabase.instance
            .reference()
            .child(Common.registation)
            .child(Common.ngo)
            .onValue,
        builder: (context, AsyncSnapshot event) {
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
            List _phone_number = new List();

            //  Map<dynamic, dynamic> donor = event.data.snapshot.value;

            Map<dynamic, dynamic> donor = event.data.snapshot.value;

            donor.forEach((key, value) {
              if (value["approved"] == true) {
                _name_list.add(value["Name"]);
                _email_list.add(value["Email"]);
                //  _phone_number_list.add(value["Phone Number"]);

                _serialNumber.add(value["Serial Number"]);

                _referance.add(value["Refferance"]);

                _phone_number.add(value["phone_number"]);

                ///  _approved_list.add(value["approved"]);
              }
            });

            //   print(_name_list[0]);

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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
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
                                Text(
                                  _referance[index] == null
                                      ? ""
                                      : _phone_number[index],
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  FlutterPhoneState.startPhoneCall(
                                      "${_phone_number[index]}");
                                },
                                child: Icon(
                                  Icons.phone,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        });
  }
}
