import 'package:flutter/material.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../Home.dart';
import 'Pages/Admin.dart';
import 'Pages/Donor.dart';
import 'Pages/Ngo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(Common.usertype);

    return SafeArea(
      child: Scaffold(
          body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          welcome(),
          Common.usertype == "NGO"
              ? Expanded(child: NgoPage())
              : Common.usertype == "Admin"
                  ? Expanded(child: AdminPage())
                  : Expanded(child: new DonorPage())
        ],
      )),
    );
  }

  welcome() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Welcome  ${Common.usertype}",
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold),
          ),
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text("Profile"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("LogOut"),
              ),
            ],
            //initialValue: 2,
            onCanceled: () {
              print("You have canceled the menu.");
            },
            onSelected: (value) {
              print("value:$value");

              if (value == 2) {
                logOut();
              }
            },
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }

  void logOut() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove("user");

    sp.remove("gmail");

    Common.gmail = "";
    Common.usertype = "";

    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => LogInAndRegistationPage()));
  }
}
