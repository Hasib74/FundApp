import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Common {
  static var registation = "Registation";
  static var donor = "Donor";
  static var ngo = "Ngo";
  static var usertype = "";
  static var gmail = "";
  static var branch = "Branch";
  //static var employ = "Employ";
  static var event = "Event";
  static var distributor = "Distributor";
  static var admin = "Admin";
  static var message = "Message";
  static var post = "Post";

  static ShowDialog(title, content, context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
                //Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static snackBar(text, context) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 500),
    ));
  }

  static Future<String> getUser() async {
    //String user;

    SharedPreferences sp = await SharedPreferences.getInstance();

    return "${sp.getString("user")},${sp.getString("gmail")}";
  }
}
