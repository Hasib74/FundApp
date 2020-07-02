import 'package:flutter/material.dart';
import 'package:fundapp/Src/Display/Pages/Admin/CommunicatePage.dart';

import 'Admin/Employ.dart';
import 'Admin/Home.dart';
import 'Admin/Request.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var tab = "Status";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tabs(),
        SizedBox(
          height: 10,
        ),
        if (tab == "Status")
          Expanded(child: Status())
        else if (tab == "Request")
          Expanded(child: Request())
        else if (tab == "Communicate")
          Expanded(child: CommunicatePage())
      ],
    );
  }

  tabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              tab = "Status";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Status" ? Color(0xffFF5126) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                ]),

            child: Center(
                child: Text(
              "   Status    ",
              style: TextStyle(
                  color: tab == "Status" ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            )),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        InkWell(
          onTap: () {
            setState(() {
              tab = "Request";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Request" ? Color(0xffFF5126) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                ]),

            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "   Request    ",
                    style: TextStyle(
                        color: tab == "Request" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 8,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0xffFF5126),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        InkWell(
          onTap: () {
            setState(() {
              tab = "Communicate";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Communicate" ? Color(0xffFF5126) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                ]),

            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "   Communicate    ",
                    style: TextStyle(
                        color:
                            tab == "Communicate" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
      ],
    );
  }
}
