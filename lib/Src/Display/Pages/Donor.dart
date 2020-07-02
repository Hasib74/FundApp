import 'package:flutter/material.dart';
import 'package:fundapp/Src/Display/Pages/Donor/Distributor.dart';
import 'package:fundapp/Src/Display/Pages/Donor/Event.dart';
import 'package:fundapp/Src/Display/Pages/Donor/SSLPage.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

import 'Admin/Employ.dart';
import 'Donor/Home.dart';

class DonorPage extends StatefulWidget {
  @override
  _DonorPageState createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  var tab = "Home";

  @override
  Widget build(BuildContext context) {
    print("Donor gmail ${Common.gmail}");

    return Column(
      children: <Widget>[
        tabs(),
        tab == "Home"
            ? Expanded(child: Home())
            : tab == "Event"
                ? Expanded(child: new Event())
                : Expanded(child: new SSlPage()),
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
              tab = "Event";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Event" ? Color(0xffFF5126) : Colors.white,
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
                    "   Event    ",
                    style: TextStyle(
                        color: tab == "Event" ? Colors.white : Colors.black,
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
              tab = "Fund Transfer";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color:
                    tab == "Fund Transfer" ? Color(0xffFF5126) : Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                ]),

            child: Center(
                child: Text(
              "   Fund Transfer    ",
              style: TextStyle(
                  color: tab == "Fund Transfer" ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500),
            )),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
      ],
    );
  }
}
