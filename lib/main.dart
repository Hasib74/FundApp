/*void main() {
  if (WebRTC.platformIsDesktop)
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(new MyApp());
}*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

import 'Src/Display/Home.dart';
import 'Src/Home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Common.getUser().then((user) {
    print("User Info  ${user}");

    if (user != "null,null") {
      List user_info = user.split(",");

      String userType = user_info[0];
      String userGmail = user_info[1];

      if (userType == "NGO") {
        Common.usertype = "NGO";
        Common.gmail = userGmail;

        runApp(Home());
      } else if (userType == "Donor") {
        Common.usertype = "Donor";
        Common.gmail = userGmail;

        runApp(Home());
      } else if (userType == "Admin") {
        Common.usertype = "Admin";
        Common.gmail = userGmail;

        runApp(Home());
      }
    } else {
      runApp(MaterialApp(home: LogInAndRegistationPage()));
    }
  });
}
