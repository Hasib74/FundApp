class Post {
  List<dynamic> data_list = new List();

  Post(Map<dynamic, dynamic> map) {
    print("Initial  ${map}");
    Map<dynamic, dynamic> list = map;

    list.forEach((gmail, value) {
      //List<Messages> messages_list = new List();

      Map<dynamic, dynamic> data = value;

      data.forEach((key, value) {
        /*messages_list.add(Messages(
            dateAndTime: value["date and time"], messge: value["message"]));*/

        data_list.add(new Data(
            gmail,
            Messages(
                messge: value["message"],
                dateAndTime: value["date and time"])));
      });
    });
  }
}

class Data {
  String gmail;
  Messages messages;

  Data(this.gmail, this.messages);
}

class Messages {
  String dateAndTime;
  String messge;

  Messages({this.dateAndTime, this.messge});
}
