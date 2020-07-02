import 'package:flutter/material.dart';
import 'package:fundapp/Src/model/message.dart';

class MessageWidget extends StatelessWidget {
  dynamic data;

  MessageWidget({this.data});

  @override
  Widget build(BuildContext context) {
    print("The gmail is  ${data.gmail}");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color(0xff8057BE),
                  ),
                  child: Center(
                    child: Text(
                      data.gmail.endsWith("admin@gmailcom") ? "A" : "D",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.gmail.replaceAll(" ", "."),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      data.messages.dateAndTime,
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "                   ${data.messages.messge}",
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
