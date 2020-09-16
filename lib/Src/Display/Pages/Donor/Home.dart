import 'package:flutter/material.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:fundapp/Src/Widget/messageCardWidget.dart';
import 'package:fundapp/Src/model/Post.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseDatabase.instance.reference().child(Common.post).onValue,
      builder: (context, AsyncSnapshot snapshot) {
        // debugPrint(" The post data is  ${snapshot.data.snapshot.value}");

        //TotalMessage total_message = new TotalMessage();

        /*print(
                    "The message is  ${total_message.total_message_list[0].data[0].message}");*/

        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data.snapshot.value != null) {
          Post message;

          message = Post(snapshot.data.snapshot.value);

          return ListView.builder(
              shrinkWrap: true,
              itemCount: message.data_list.length,
              itemBuilder: (context, int index) {
                return MessageWidget(
                  data: message.data_list[index],
                );
              });
        } else {
          return Center(
            child: Text("Empty"),
          );
        }
      },
    );
  }
}
