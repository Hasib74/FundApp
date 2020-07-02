import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SSlPage extends StatefulWidget {
  /*var hr_rate;

  BookPage({this.hr_rate});
*/
  @override
  _SSlPageState createState() => _SSlPageState();
}

class _SSlPageState extends State<SSlPage> {
  var price = 173;

  bool bank_account = false;
  bool credit_or_debit_card = false;

  var account_type = "personal";

  var card_type = "visa";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (bank_account) {
                      bank_account = false;
                    } else {
                      bank_account = true;
                      credit_or_debit_card = false;
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bank Account ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          bank_account
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              BankAccontWidget(),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (credit_or_debit_card) {
                    setState(() {
                      credit_or_debit_card = false;
                    });
                  } else {
                    setState(() {
                      credit_or_debit_card = true;

                      bank_account = false;
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Credit or Debit Card ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          credit_or_debit_card
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CreditOrDebitCardWidget(),
              SizedBox(
                height: 20,
              ),
              ConfirmButtonWidget(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BankAccontWidget() {
    if (bank_account == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Account Type ",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                account_type = "personal";
              });
            },
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: account_type == "personal"
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Personal",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                account_type = "business";
              });
            },
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: account_type == "business"
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Business",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Bank Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70,

                  contentPadding: EdgeInsets.all(8),
                  // Added this
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Branch Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70,

                  contentPadding: EdgeInsets.all(8),
                  // Added this
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Account Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70,

                  contentPadding: EdgeInsets.all(8),
                  // Added this
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Account Number",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70,

                  contentPadding: EdgeInsets.all(8),
                  // Added this
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  CreditOrDebitCardWidget() {
    if (credit_or_debit_card == true) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Card Type ",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                card_type = "visa";
              });
            },
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: card_type == "visa"
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Visa",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              setState(() {
                card_type = "master_card";
              });
            },
            child: Row(
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: card_type == "master_card"
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.black,
                            ),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Master Card",
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Card Holder Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70,

                  contentPadding: EdgeInsets.all(8),
                  // Added this
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Card Number",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              new TextField(
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70,

                  contentPadding: EdgeInsets.all(8),
                  // Added this
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                " End Date",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "mm",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "yyyy",
                            style: TextStyle(color: Colors.black26),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " CVV",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 100,
                height: 30,
                child: new TextField(
                  cursorColor: Colors.black,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white70,

                    contentPadding: EdgeInsets.all(8),
                    // Added this
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  ConfirmButtonWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Center(
              child: Text(
                "Confirm",
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
