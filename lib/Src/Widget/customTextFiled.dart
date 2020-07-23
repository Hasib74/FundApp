import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  TextEditingController post_controller;

  CustomTextFiled(this.post_controller);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: TextField(
            autofocus: false,
            autocorrect: false,
            controller: post_controller,
            maxLines: 5,
            maxLength: 500,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Write your post..",
            ),
          ),
        ));
  }
}
