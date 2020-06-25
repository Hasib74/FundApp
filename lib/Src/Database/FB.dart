import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:fundapp/Src/Utlis/Common.dart';

class FB {
  Future<String> registationForDonor(name, email, passportOrNid, mailingAddress,
      reffernce, TextEditingController password_controller) async {
    var status;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.registation)
        .child(Common.donor)
        .child(email.toString().replaceAll(".", ""))
        .once()
        .then((value) async {
      print("Regsiattion value  ${value.value}");

      if (value.value == null) {
        await FirebaseDatabase.instance
            .reference()
            .child(Common.registation)
            .child(Common.donor)
            .child(email.toString().replaceAll(".", ""))
            .set({
          "Name": name,
          "Email": email,
          "Passport Or Nid": passportOrNid,
          "Mailing Address": mailingAddress,
          "Refferance": reffernce,
          "password": password_controller.value.text
        }).then((value) {
          status = "Success";

          print("Value is success");
        }).catchError((err) {
          status = "Failed";
        });
      } else {
        status = "You Are Already Registatred";
      }
    }).catchError((err) {
      status = "Failed";
    });

    return status;
  }

  ///Registrations For NGO

  Future<String> registationForNgo(
      name, email, govtDoccuments, serialNumber, reffernce) async {
    var status;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.registation)
        .child(Common.ngo)
        .child(email.toString().replaceAll(".", ""))
        .once()
        .then((value) async {
      print("Regsiattion value  ${value.value}");

      if (value.value == null) {
        await FirebaseDatabase.instance
            .reference()
            .child(Common.registation)
            .child(Common.ngo)
            .child(email.toString().replaceAll(".", ""))
            .set({
          "Name": name,
          "Email": email,
          "Govt Doccuments": govtDoccuments,
          "Serial Number": serialNumber,
          "Refferance": reffernce
        }).then((value) {
          status = "Success";

          print("Value is success");
        }).catchError((err) {
          status = "Failed";
        });
      } else {
        status = "You Are Already Registatred";
      }
    }).catchError((err) {
      status = "Failed";
    });

    return status;
  }

  Future<String> logIn(email, password) async {
    // print("Email    ${email}");

    String info;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.registation)
        .child(Common.donor)
        .child(email.toString().replaceAll(".", ""))
        .once()
        .then((value) async {
      if (value.value != null) {
        print("Valueeeeee ${value.value}");

        info = "Donor,${email}";
      } else {
        await FirebaseDatabase.instance
            .reference()
            .child(Common.registation)
            .child(Common.ngo)
            .child(email.toString().replaceAll(".", ""))
            .once()
            .then((value) {
          if (value.value != null) {
            print("Valueeeeee  2  ${value.value}");

            info = "NGO,${email}";
          }

          //if(value.value[""])
        });
      }
    });

/*   await  FirebaseDatabase.instance
        .reference()
        .child(Common.admin)
        .once()
        .then((value) async {
      if (value.value["email"] == email &&
          value.value["password"] == password) {
        print(
            "Valueeeeeeeeeeeeeeeeeeeeeeeeeee  ${value.value["email"]} , ${value.value["password"]}");

        info = "Admin,${email}";
      } else {

      }
    });*/

    return info;
  }

  Future<bool> addBranch(name, location, id) async {
    bool isSaved;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.branch)
        .child(Common.gmail.replaceAll(".", ""))
        .child(new DateTime.now().toIso8601String().replaceAll(".", ""))
        .set({"Name": name, "Location": location, "ID": id}).then((value) {
      isSaved = true;
    }).catchError((err) {
      isSaved = false;
    });

    return isSaved;
  }

  Future<bool> addDistributor(name, location, id) async {
    bool isSaved;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.distributor)
        .child(Common.gmail.replaceAll(".", ""))
        .child(new DateTime.now().toIso8601String().replaceAll(".", ""))
        .set({"Name": name, "Location": location, "ID": id}).then((value) {
      isSaved = true;
    }).catchError((err) {
      isSaved = false;
    });

    return isSaved;
  }

  /*
  * _name_controller.value.text.isNotEmpty &&
                _location_controller.value.text.isNotEmpty &&
                _phoneNumber.value.text.isNotEmpty && _email_address.value.text.isNotEmpty)
  * */

  Future<bool> saveEmploy(name, location, phone, email) async {
    bool isSaved;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.employ)
        .child(Common.gmail.replaceAll(".", ""))
        .child(new DateTime.now().toIso8601String().replaceAll(".", ""))
        .set({
      "Name": name,
      "Location": location,
      "Phone Number": phone,
      "Email": email
    }).then((value) {
      isSaved = true;
    }).catchError((err) {
      isSaved = false;
    });

    return isSaved;
  }

  Future<bool> saveEmployByDonor(name, location, phone, email) async {
    bool isSaved;

    await FirebaseDatabase.instance
        .reference()
        .child(Common.employ)
        .child(Common.gmail.replaceAll(".", ""))
        .child(new DateTime.now().toIso8601String().replaceAll(".", ""))
        .set({
      "Name": name,
      "Location": location,
      "Phone Number": phone,
      "Email": email
    }).then((value) {
      isSaved = true;
    }).catchError((err) {
      isSaved = false;
    });

    return isSaved;
  }

  Future<bool> accept(gmail, userType) {
    if (userType == "donar") {
      FirebaseDatabase.instance
          .reference()
          .child(Common.registation)
          .child(Common.donor)
          .child(gmail.toString().replaceAll(".", ""))
          .update({"approved": true});
    } else {
      FirebaseDatabase.instance
          .reference()
          .child(Common.registation)
          .child(Common.ngo)
          .child(gmail.toString().replaceAll(".", ""))
          .update({"approved": true});
    }
  }

  Future<bool> declie(gmail, userType) {
    print("${gmail.toString().replaceAll(".", "")}");

    if (userType == "donar") {
      FirebaseDatabase.instance
          .reference()
          .child(Common.registation)
          .child(Common.donor)
          .child(gmail.toString().replaceAll(".", ""))
          .remove();
    } else {
      FirebaseDatabase.instance
          .reference()
          .child(Common.registation)
          .child(Common.ngo)
          .child(gmail.toString().replaceAll(".", ""))
          .remove();
    }
  }
}
