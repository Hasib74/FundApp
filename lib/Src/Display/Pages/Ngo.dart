import 'package:flutter/material.dart';

import 'Admin/Employ.dart';
import 'NGO/Branch.dart';
import 'NGO/Home.dart';

class NgoPage extends StatefulWidget {
  @override
  _NgoPageState createState() => _NgoPageState();
}

class _NgoPageState extends State<NgoPage> {
  var tab = "Home";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tabs(),
        tab == "Home"
            ? Expanded(child: Home())
            : tab == "Branch"
                ? Expanded(child: new Branch())
                : Expanded(child: new Employ())
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
              tab = "Branch";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Branch" ? Color(0xffFF5126) : Colors.white,
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
                    "   Branch    ",
                    style: TextStyle(
                        color: tab == "Branch" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
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
