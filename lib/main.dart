/*void main() {
  if (WebRTC.platformIsDesktop)
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MyApp());
}*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fundapp/Src/FlutterDataProvider/fingurPrint.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

import 'Src/Display/Home.dart';
import 'Src/Home.dart';

FingurPrint fingurPrint = new FingurPrint();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(InitialPage());
}

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  Widget currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentUser();

    print("The current widget  ${currentUser}");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            backgroundColor: Colors.white,
            buttonColor: Colors.deepOrange,
            indicatorColor: Colors.deepOrange,
            textSelectionColor: Colors.deepOrange,
            textSelectionHandleColor: Colors.deepOrange,
            unselectedWidgetColor: Colors.black54,
            cursorColor: Colors.deepOrange,
            dividerColor: Colors.black54,
            accentColor: Colors.deepOrange,
            highlightColor: Colors.white,
            textTheme: TextTheme(
              headline1: TextStyle(color: Colors.deepOrange),
              subtitle1: TextStyle(color: Colors.black87, fontSize: 16),
              subtitle2: TextStyle(color: Colors.black54, fontSize: 14),

              // body1: TextStyle(color: Colors.black54,fontSize: 14)
            )),
        home: currentUser ?? Container());
  }

  getCurrentUser() {
    Common.getUser().then((user) {
      print("User Info  ${user}");

      if (user != "null,null") {
        List user_info = user.split(",");

        String userType = user_info[0];
        String userGmail = user_info[1];

        print("User Type  ${userType == "Admin"}");

        if (userType == "NGO") {
          Common.usertype = "NGO";
          Common.gmail = userGmail;

          setState(() {
            currentUser = HomePage();
          });
        } else if (userType == "Donor") {
          Common.usertype = "Donor";
          Common.gmail = userGmail;

          setState(() {
            currentUser = HomePage();
          });
        } else if (userType == "Admin") {
          Common.usertype = "Admin";
          Common.gmail = userGmail;

          setState(() {
            currentUser = HomePage();
          });
        }
      } else {
        setState(() {
          currentUser = LogInAndRegistationPage();
        });
        /* runApp(MaterialApp(
            theme: ThemeData(
                backgroundColor: Colors.white,
                buttonColor: Colors.deepOrange,
                indicatorColor: Colors.deepOrange,
                textTheme:
                TextTheme(headline1: TextStyle(color: Colors.deepOrange))),
            home: LogInAndRegistationPage()));*/
      }
    });
  }
}
