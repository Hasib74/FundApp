import 'package:flutter/material.dart';

/*
typedef IntCallback = Function(num);
*/

class CustomButton extends StatelessWidget {
  String title;

  VoidCallback actionCallBack;

  CustomButton({this.title, this.actionCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => actionCallBack(),
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(color: Theme.of(context).accentColor),
        child: Center(
          child: Text(
            "${title}",
            style: TextStyle(
                color: Theme.of(context).highlightColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
