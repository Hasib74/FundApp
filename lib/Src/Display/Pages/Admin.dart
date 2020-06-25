import 'package:flutter/material.dart';

import 'Admin/Employ.dart';
import 'Admin/Home.dart';
import 'Admin/Request.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {



  var tab = "Home";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tabs(),
        tab == "Home"
            ? Expanded(child: Home())
            : tab == "Request"
                ? Expanded(child: Request())
                : Expanded(child: Employ()),
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
              tab = "Home";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Home" ? Color(0xffFF5126) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                ]),

            child: Center(
                child: Text(
              "   Home    ",
              style: TextStyle(
                  color: tab == "Home" ? Colors.white : Colors.black,
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
              tab = "Employ";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Employ" ? Color(0xffFF5126) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                ]),

            child: Center(
                child: Text(
              "   Employ    ",
              style: TextStyle(
                  color: tab == "Employ" ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            )),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
      ],
    );
  }
}
