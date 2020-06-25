import 'package:flutter/material.dart';
import 'package:fundapp/Src/Display/Pages/Donor/Distributor.dart';
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
            : tab == "Distributor"
                ? Expanded(child: new Distributor())
                : Expanded(child: new Employ()),
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
              tab = "Distributor";
            });
          },
          child: Container(
            // width: 50,
            height: 24,
            decoration: BoxDecoration(
                color: tab == "Distributor" ? Color(0xffFF5126) : Colors.white,
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
                    "   Distributor    ",
                    style: TextStyle(
                        color:
                            tab == "Distributor" ? Colors.white : Colors.black,
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
