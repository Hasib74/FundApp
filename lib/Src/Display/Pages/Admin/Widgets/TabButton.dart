import 'package:flutter/material.dart';
import 'package:fundapp/Src/ButtonAction.dart';
import 'package:fundapp/Src/Utlis/text.dart';

typedef ButtonClickAction = Function(ButtonAction);

class TabButton extends StatelessWidget {
  String buttonName;
  ButtonClickAction buttonClickAction;
  var tab;

  TabButton({this.buttonName, this.buttonClickAction(ButtonAction), this.tab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (buttonName == status) {
          ButtonAction.Status;
          buttonClickAction(ButtonAction.Status);
        } else if (buttonName == request) {
          ButtonAction.Request;
          buttonClickAction(ButtonAction.Request);
        } else if (buttonName == communicate) {
          ButtonAction.Communicate;
          buttonClickAction(ButtonAction.Communicate);
        } else if (buttonName == volunteer) {
          ButtonAction.Volunteer;
          buttonClickAction(ButtonAction.Volunteer);
        }
      },
      child: Container(
        // width: 50,
        height: 24,
        decoration: BoxDecoration(
            color: tab == buttonName ? Color(0xffFF5126) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 0.5)
            ]),

        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "   ${buttonName}    ",
                style: TextStyle(
                    color: tab == buttonName ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
           /* Positioned(
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
            )*/
          ],
        ),
      ),
    );
  }
}
