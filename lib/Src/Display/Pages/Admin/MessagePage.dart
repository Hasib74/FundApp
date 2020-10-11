import 'package:flutter/material.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:fundapp/Src/Widget/customButtonWidget.dart';
import 'package:fundapp/Src/Widget/customTextFiled.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fundapp/Src/Widget/messageCardWidget.dart';
import 'package:fundapp/Src/model/message.dart';

class MessagePage extends StatelessWidget {
  FB fb = new FB();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
      FirebaseDatabase.instance
          .reference()
          .child(Common.message)
          .onValue,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData &&
            snapshot.hasError == false &&
            snapshot.data != null) {
          if (snapshot == null) {
            return Container();
          } else {
            Message message;


            try {
              message = Message(snapshot.data.snapshot.value);
            } catch (err) {

            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: message.data_list.length,
                itemBuilder: (context, int index) {
                  return MessageWidget(
                    data: message.data_list[index],
                  );
                });
          }
        } else {
          return Container();;
        }
      },
    );
  }
}
