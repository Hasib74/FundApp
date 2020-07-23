import 'package:flutter/material.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:fundapp/Src/Widget/messageCardWidget.dart';
import 'package:fundapp/Src/model/Post.dart';
import 'package:firebase_database/firebase_database.dart';

class Event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  @override
  Widget build(BuildContext context) {
    print("Eventsssssssssssssssssssssssss");

    return loadEvent();
  }

  loadEvent() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: StreamBuilder(
        stream: FirebaseDatabase.instance
            .reference()
            .child(Common.event)
            //  .child(Common.gmail.replaceAll(".", ""))
            .onValue,
        builder: (BuildContext context, event) {
          //  print(event.data.snapshot.value);

          if (event.hasError ||
              event.data == null ||
              event.data.snapshot.value == null) {
            return Container();
          } else {
            List _name_list = new List();
            List _location_list = new List();
            List _description_list = new List();
            List _time_list = new List();
            // List _approved_list = new List();

            Map<dynamic, dynamic> branch = event.data.snapshot.value;
            branch.forEach((key, value) {
              _name_list.add(value["Name"]);
              _location_list.add(value["Location"]);
              _description_list.add(value["Description"]);
              _time_list.add(value["Time"]);

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${_name_list[index]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Location :${_location_list[index]}",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Time :${_time_list[index]}",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${_description_list[index]}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            /* _approved_list[index] == null
                                ? Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.black54,
                                  )
                                : Icon(
                                    Icons.check_circle,
                                    color: Colors.greenAccent,
                                  ),*/
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
}
