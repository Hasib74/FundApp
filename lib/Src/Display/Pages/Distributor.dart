import 'package:flutter/material.dart';
import 'package:fundapp/Src/Display/Pages/Admin/Volunteer.dart';
import 'package:fundapp/Src/Display/Pages/Distributor/Branch.dart';
import 'package:fundapp/Src/Display/Pages/Distributor/ContractDonor.dart';
import 'package:fundapp/Src/Display/Pages/Distributor/Event.dart';
import 'package:fundapp/Src/Display/Pages/Distributor/SSLPage.dart';

import 'Admin/Employ.dart';

class NgoPage extends StatefulWidget {
  @override
  _NgoPageState createState() => _NgoPageState();
}

class _NgoPageState extends State<NgoPage> {
  var tab = "Contract Donor";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tabs(),
        tab == "Contract Donor"
            ? Expanded(child: ContractDonor())
            : tab == "Event"
                ? Expanded(child: new Event())
                : tab =="Volunteer"? Expanded(child: Volunteer()) : Expanded(child: new SSlPage())
      ],
    );
  }

  tabs() {
    return Container(
      height: 35,
      child: ListView(
  shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                tab = "Contract Donor";
              });
            },
            child: Container(
              // width: 50,
              height: 24,
              decoration: BoxDecoration(
                  color:
                      tab == "Contract Donor" ? Color(0xffFF5126) : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                  ]),

              child: Center(
                  child: Text(
                " Contract Donor ",
                style: TextStyle(
                    color: tab == "Contract Donor" ? Colors.white : Colors.black,
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
                tab = "Transfer Money";
              });
            },
            child: Container(
              // width: 50,
              height: 24,
              decoration: BoxDecoration(
                  color:
                      tab == "Transfer Money" ? Color(0xffFF5126) : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                  ]),

              child: Center(
                  child: Text(
                "   Transfer Money    ",
                style: TextStyle(
                    color: tab == "Transfer Money" ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              )),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),

          InkWell(
            onTap: () {
              setState(() {
                tab = "Volunteer";
              });
            },
            child: Container(
              // width: 50,
              height: 24,
              decoration: BoxDecoration(
                  color:
                  tab == "Volunteer" ? Color(0xffFF5126) : Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
                  ]),

              child: Center(
                  child: Text(
                    "   Volunteer    ",
                    style: TextStyle(
                        color: tab == "Volunteer" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
        ],
      ),
    );
  }
}
