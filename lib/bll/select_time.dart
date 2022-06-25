import 'package:flutter/material.dart';

Future _selectTime(BuildContext context, TimeOfDay selectedTime) async {
  // TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTime,
  );
  dynamic response = [];
  if (picked != null) {
    // setState(() {
    response["selectedTime"] = picked;
    response["_hour"] = selectedTime.hour.toString();
    response["_minute"] = selectedTime.minute.toString();
    response["_time"] = response["_hour"] + ' : ' + response["_minute"];
    //   _timeController.text = _time;
    //   _timeController.text = formatDate(
    //       DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
    //       [hh, ':', nn, " ", am]).toString();
    // // })

    return response;
  }
}
