import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fundapp/Src/Database/FB.dart';
import 'package:fundapp/Src/Display/Pages/Admin/Event.dart';
import 'package:fundapp/Src/Display/Pages/Admin/MessagePage.dart';
import 'package:fundapp/Src/Display/Pages/Admin/PostPage.dart';
import 'package:fundapp/Src/Utlis/Common.dart';
import 'package:fundapp/Src/Widget/customButtonWidget.dart';
import 'package:fundapp/Src/Widget/customTextFiled.dart';
import 'package:fundapp/Src/Widget/messageCardWidget.dart';
import 'package:fundapp/Src/model/message.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> with TickerProviderStateMixin {
  FB fb = new FB();

  int current_index = 0;

  TabController _tabController;
  GlobalKey<ScaffoldState> globalKey = new GlobalKey();

  TextEditingController post_controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        current_index = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Tab current position  ${current_index}");

    return Scaffold(
      body: Column(
        children: [
          TabBar(
            unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
            labelColor: Theme.of(context).textSelectionColor,
            controller: _tabController,
            indicatorColor: Theme.of(context).indicatorColor,
            tabs: [
              Tab(
                child: Text(
                  "Message",
                  /*   style: Theme.of(context).textTheme.bodyText2,*/
                ),
              ),
              Tab(
                child: Text("Post"),
              ),
              Tab(
                child: Text("Event"),
              ),
            ],
          ),
          current_index != 2 ? CustomTextFiled(post_controller) : Container(),
          current_index != 2
              ? CustomButton(
                  title: _tabController.index == 0 ? "Message" : "Post",
                  actionCallBack: () {
                    if (post_controller.value.text.isNotEmpty) {
                      _tabController.index == 0
                          ? fb.store_message(post_controller.value.text)
                          : fb.store_post(post_controller.value.text);
                      post_controller.text = "";
                    } else {
                      globalKey.currentState.showSnackBar(
                          new SnackBar(content: Text("Empty filed !!!")));
                    }
                  },
                )
              : Container(),
          if (current_index == 0)
            Expanded(child: MessagePage())
          else if (current_index == 1)
            Expanded(child: PostPage())
          else
            Expanded(child: Event())
        ],
      ),
    );
  }
}
