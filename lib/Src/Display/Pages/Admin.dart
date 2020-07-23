import 'package:flutter/material.dart';
import 'package:fundapp/Src/ButtonAction.dart';
import 'package:fundapp/Src/Display/Pages/Admin/CommunicatePage.dart';
import 'package:fundapp/Src/Display/Pages/Admin/Volunteer.dart';
import 'package:fundapp/Src/Display/Pages/Admin/Widgets/TabButton.dart';
import 'package:fundapp/Src/Utlis/text.dart';

import 'Admin/Employ.dart';
import 'Admin/Home.dart';
import 'Admin/Request.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var tab = status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        tabs(),
        SizedBox(
          height: 10,
        ),
        if (tab == status)
          Expanded(child: Status())
        else if (tab == request)
          Expanded(child: Request())
        else if (tab == communicate)
          Expanded(child: CommunicatePage())
        else if (tab == volunteer)
          Expanded(child: Volunteer())
      ],
    );
  }

  tabs() {
    return Container(
      height: 33,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TabButton(
            tab: tab,
            buttonName: status,
            buttonClickAction: (action) {
              print("Action  ${action}");
              tabChange(action);
            },
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          TabButton(
            tab: tab,
            buttonName: request,
            buttonClickAction: (action) {
              print("Action  ${action}");
              tabChange(action);
            },
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          TabButton(
            tab: tab,
            buttonName: communicate,
            buttonClickAction: (action) {
              print("Action  ${action}");
              tabChange(action);
            },
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          TabButton(
            buttonName: volunteer,
            tab: tab,
            buttonClickAction: (action) {
              print("Action  ${action}");
              tabChange(action);
            },
          ),
        ],
      ),
    );
  }

  void tabChange(action) {
    switch (action) {
      case ButtonAction.Status:
        print("Tab on Status");

        setState(() {
          tab = status;
        });

        break;

      case ButtonAction.Request:
        print("Tab on Request");

        setState(() {
          tab = request;
        });

        break;
      case ButtonAction.Communicate:
        print("Tab on Communicate");
        setState(() {
          tab = communicate;
        });

        break;

      case ButtonAction.Volunteer:
        print("Tab on Volunteer");
        setState(() {
          tab = volunteer;
        });

        break;
    }
  }
}
