import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

typedef DateAndTimeOutput = Function(dynamic);

class BasicDateTimeField extends StatelessWidget {
  DateAndTimeOutput dateAndTimeOutput;

  BasicDateTimeField({this.dateAndTimeOutput(dynamic)});

  final format = DateFormat("yyyy/MM/dd HH:mm");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xffF7F7F7)),
      child: DateTimeField(
        onChanged: (v) {
          print("The Value        ${v}");
        },
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.access_time),
          ),
          border: InputBorder.none,
        ),
        format: format,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );

            DateTime dateTime=  DateTimeField.combine(date, time).toLocal();

            print("Local Time ${dateTime}");

            dateAndTimeOutput(format.format(dateTime));

            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    );
  }
}
