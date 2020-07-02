import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class MyDialog {
  static showDialog(message, type, context) => AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: type == "Error" ? DialogType.ERROR : DialogType.SUCCES,
        body: Center(
          child: Text(
            "${message}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        title: '${type}',
        btnOkOnPress: () {},
      )..show();
}
